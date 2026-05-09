; DESCRIPTION: Composite: . Then Sets a single green pixel at (232, 184). Then Places a black line segment connecting (112, 239) to (135, 247).
; PLAN: r0=232(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=112(x1), r1=239(y1), r2=135(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single green pixel at (232, 184).
; PLAN: r0=232(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (112, 239) to (135, 247).
; PLAN: r0=112(x1), r1=239(y1), r2=135(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 239
LDI r2, 135
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
