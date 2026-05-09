; DESCRIPTION: Composite: Places a white line segment connecting (366, 39) to (413, 145) then Renders a red disk with center (101, 99) and radius 80 then Places a magenta dot at position (468, 73).
; PLAN: r0=366(x1), r1=39(y1), r2=413(x2), r3=145(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=101(x), r6=99(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x), r11=73(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 39
LDI r2, 413
LDI r3, 145
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 99
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 73
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
