; DESCRIPTION: Composite: Places a black line segment connecting (468, 208) to (317, 209) then Draws a black circle centered at (213, 179) with radius 71.
; PLAN: r0=468(x1), r1=208(y1), r2=317(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=179(y), r7=71(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 468
LDI r1, 208
LDI r2, 317
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 179
LDI r7, 71
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
