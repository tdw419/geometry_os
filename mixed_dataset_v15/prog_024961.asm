; DESCRIPTION: Places a red line segment connecting (258, 27) to (478, 195).
; PLAN: r0=258(x1), r1=27(y1), r2=478(x2), r3=195(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 27
LDI r2, 478
LDI r3, 195
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
