; DESCRIPTION: Composite: Places a yellow line segment connecting (54, 80) to (236, 69) then Draws a yellow circle centered at (101, 80) with radius 59 then Sets a single orange pixel at (365, 29).
; PLAN: r0=54(x1), r1=80(y1), r2=236(x2), r3=69(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=80(y), r7=59(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=29(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 54
LDI r1, 80
LDI r2, 236
LDI r3, 69
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 80
LDI r7, 59
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 29
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
