; DESCRIPTION: Composite: Draws a purple line from (400, 198) to (481, 14) then Places a yellow dot at position (327, 217).
; PLAN: r0=400(x1), r1=198(y1), r2=481(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=217(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 400
LDI r1, 198
LDI r2, 481
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 217
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
