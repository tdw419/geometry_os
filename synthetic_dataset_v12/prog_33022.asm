; DESCRIPTION: Composite: Places a red line segment connecting (436, 164) to (184, 183) then Places a magenta circle of radius 19 at center (52, 57).
; PLAN: r0=436(x1), r1=164(y1), r2=184(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=57(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 436
LDI r1, 164
LDI r2, 184
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 57
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
