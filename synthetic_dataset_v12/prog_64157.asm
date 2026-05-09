; DESCRIPTION: Composite: Places a blue circle of radius 71 at center (232, 90) then Places a magenta line segment connecting (307, 28) to (17, 80).
; PLAN: r0=232(x), r1=90(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=307(x1), r6=28(y1), r7=17(x2), r8=80(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 232
LDI r1, 90
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 307
LDI r6, 28
LDI r7, 17
LDI r8, 80
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
