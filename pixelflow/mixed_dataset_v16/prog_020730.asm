; DESCRIPTION: Composite: Places a black line segment connecting (72, 52) to (428, 146) then Places a purple dot at position (160, 246).
; PLAN: r0=72(x1), r1=52(y1), r2=428(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=246(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 52
LDI r2, 428
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 246
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
