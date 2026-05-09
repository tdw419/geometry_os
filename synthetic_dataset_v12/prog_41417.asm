; DESCRIPTION: Composite: Places a white line segment connecting (57, 79) to (362, 200) then Renders a white disk with center (429, 160) and radius 27.
; PLAN: r0=57(x1), r1=79(y1), r2=362(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=160(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 79
LDI r2, 362
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 160
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
