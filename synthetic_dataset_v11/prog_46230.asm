; DESCRIPTION: Composite: . Then Places a black line segment connecting (135, 202) to (20, 85). Then Sets a single red pixel at (90, 55).
; PLAN: r0=135(x1), r1=202(y1), r2=20(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=90(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (135, 202) to (20, 85).
; PLAN: r0=135(x1), r1=202(y1), r2=20(x2), r3=85(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 202
LDI r2, 20
LDI r3, 85
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single red pixel at (90, 55).
; PLAN: r0=90(x), r1=55(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 55
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
