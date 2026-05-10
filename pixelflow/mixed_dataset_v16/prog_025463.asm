; DESCRIPTION: Composite: Draws a yellow line from (222, 108) to (110, 93) then Places a white dot at position (106, 16) then Creates a green rectangular region at (480, 74) spanning 28 by 87 pixels.
; PLAN: r0=222(x1), r1=108(y1), r2=110(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=16(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=480(x), r11=74(y), r12=28(width), r13=87(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 108
LDI r2, 110
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 16
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 480
LDI r11, 74
LDI r12, 28
LDI r13, 87
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
