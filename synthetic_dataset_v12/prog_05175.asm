; DESCRIPTION: Places a white line segment connecting (403, 101) to (332, 195).
; PLAN: r0=403(x1), r1=101(y1), r2=332(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 101
LDI r2, 332
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
