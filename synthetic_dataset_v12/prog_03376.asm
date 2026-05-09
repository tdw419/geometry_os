; DESCRIPTION: Composite: Renders a purple line between points (477, 0) and (42, 219) then Places a purple circle of radius 19 at center (113, 132).
; PLAN: r0=477(x1), r1=0(y1), r2=42(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=132(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 477
LDI r1, 0
LDI r2, 42
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 132
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
