; DESCRIPTION: Places a black line segment connecting (33, 202) to (487, 36).
; PLAN: r0=33(x1), r1=202(y1), r2=487(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 202
LDI r2, 487
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
