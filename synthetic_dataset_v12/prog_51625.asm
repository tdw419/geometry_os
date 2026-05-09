; DESCRIPTION: Places a green line segment connecting (466, 171) to (499, 36).
; PLAN: r0=466(x1), r1=171(y1), r2=499(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 171
LDI r2, 499
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
