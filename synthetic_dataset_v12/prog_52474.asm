; DESCRIPTION: Composite: Creates a yellow rectangular region at (30, 58) spanning 60 by 117 pixels then Places a white dot at position (32, 240) then Draws a orange line from (2, 93) to (340, 225).
; PLAN: r0=30(x), r1=58(y), r2=60(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x), r6=240(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=2(x1), r11=93(y1), r12=340(x2), r13=225(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 58
LDI r2, 60
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 240
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 2
LDI r11, 93
LDI r12, 340
LDI r13, 225
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
