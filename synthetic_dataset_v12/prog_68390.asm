; DESCRIPTION: Places a red line segment connecting (289, 209) to (343, 226).
; PLAN: r0=289(x1), r1=209(y1), r2=343(x2), r3=226(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 209
LDI r2, 343
LDI r3, 226
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
