; DESCRIPTION: Composite: Places a purple dot at position (28, 135) then Places a purple line segment connecting (368, 5) to (146, 212).
; PLAN: r0=28(x), r1=135(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=5(y1), r7=146(x2), r8=212(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 28
LDI r1, 135
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 5
LDI r7, 146
LDI r8, 212
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
