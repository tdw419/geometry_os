; DESCRIPTION: Composite: Draws a red line from (493, 192) to (434, 24) then Draws a magenta circle centered at (213, 76) with radius 76.
; PLAN: r0=493(x1), r1=192(y1), r2=434(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=76(y), r7=76(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 192
LDI r2, 434
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 76
LDI r7, 76
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
