; DESCRIPTION: Composite: Draws a magenta line from (399, 20) to (120, 197) then Renders a blue disk with center (429, 100) and radius 45.
; PLAN: r0=399(x1), r1=20(y1), r2=120(x2), r3=197(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=100(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 20
LDI r2, 120
LDI r3, 197
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 100
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
