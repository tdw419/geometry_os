; DESCRIPTION: Composite: Places a magenta circle of radius 70 at center (121, 84) then Sets a single red pixel at (121, 141).
; PLAN: r0=121(x), r1=84(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=121(x), r6=141(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 121
LDI r1, 84
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 121
LDI r6, 141
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
