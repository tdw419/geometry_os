; DESCRIPTION: Places a black line segment connecting (399, 171) to (202, 238).
; PLAN: r0=399(x1), r1=171(y1), r2=202(x2), r3=238(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 171
LDI r2, 202
LDI r3, 238
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
