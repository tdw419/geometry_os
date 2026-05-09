; DESCRIPTION: Composite: Sets a single white pixel at (446, 236) then Places a purple line segment connecting (30, 252) to (27, 134).
; PLAN: r0=446(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=30(x1), r6=252(y1), r7=27(x2), r8=134(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 30
LDI r6, 252
LDI r7, 27
LDI r8, 134
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
