; DESCRIPTION: Composite: Creates a green rectangular region at (76, 128) spanning 110 by 61 pixels then Places a orange dot at position (310, 255) then Draws a cyan line from (145, 30) to (262, 78).
; PLAN: r0=76(x), r1=128(y), r2=110(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=310(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=145(x1), r11=30(y1), r12=262(x2), r13=78(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 128
LDI r2, 110
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 145
LDI r11, 30
LDI r12, 262
LDI r13, 78
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
