; DESCRIPTION: Composite: Places a black line segment connecting (403, 30) to (166, 202) then Places a red dot at position (407, 80).
; PLAN: r0=403(x1), r1=30(y1), r2=166(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=407(x), r6=80(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 403
LDI r1, 30
LDI r2, 166
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 407
LDI r6, 80
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
