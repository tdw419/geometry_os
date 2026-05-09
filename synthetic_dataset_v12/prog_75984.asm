; DESCRIPTION: Composite: Places a magenta line segment connecting (440, 37) to (365, 28) then Places a purple circle of radius 23 at center (169, 84).
; PLAN: r0=440(x1), r1=37(y1), r2=365(x2), r3=28(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=169(x), r6=84(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 37
LDI r2, 365
LDI r3, 28
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 84
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
