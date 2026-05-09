; DESCRIPTION: Composite: Draws a blue line from (481, 99) to (366, 40) then Draws a cyan circle centered at (300, 156) with radius 59.
; PLAN: r0=481(x1), r1=99(y1), r2=366(x2), r3=40(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=156(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 99
LDI r2, 366
LDI r3, 40
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 156
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
