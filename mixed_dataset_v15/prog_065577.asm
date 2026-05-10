; DESCRIPTION: Composite: Draws a yellow line from (356, 151) to (305, 116) then Places a green dot at position (318, 145) then Places a orange 85x87 rectangle at position (320, 33).
; PLAN: r0=356(x1), r1=151(y1), r2=305(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=318(x), r6=145(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=320(x), r11=33(y), r12=85(width), r13=87(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 356
LDI r1, 151
LDI r2, 305
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 318
LDI r6, 145
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 320
LDI r11, 33
LDI r12, 85
LDI r13, 87
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
