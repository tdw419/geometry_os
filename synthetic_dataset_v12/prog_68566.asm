; DESCRIPTION: Composite: Places a magenta line segment connecting (108, 125) to (440, 106) then Places a magenta circle of radius 73 at center (280, 172).
; PLAN: r0=108(x1), r1=125(y1), r2=440(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=280(x), r6=172(y), r7=73(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 108
LDI r1, 125
LDI r2, 440
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 172
LDI r7, 73
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
