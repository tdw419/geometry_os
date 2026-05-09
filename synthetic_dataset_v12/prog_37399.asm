; DESCRIPTION: Composite: Draws a purple rectangle at (126, 74) with width 51 and height 98 then Renders a red disk with center (193, 77) and radius 51.
; PLAN: r0=126(x), r1=74(y), r2=51(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=77(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 126
LDI r1, 74
LDI r2, 51
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 77
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
