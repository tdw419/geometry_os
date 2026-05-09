; DESCRIPTION: Composite: . Then Places a red dot at position (4, 184). Then Places a white line segment connecting (112, 10) to (145, 45).
; PLAN: r0=4(x), r1=184(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=112(x1), r1=10(y1), r2=145(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (4, 184).
; PLAN: r0=4(x), r1=184(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 4
LDI r1, 184
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (112, 10) to (145, 45).
; PLAN: r0=112(x1), r1=10(y1), r2=145(x2), r3=45(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 10
LDI r2, 145
LDI r3, 45
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
