; DESCRIPTION: Places a green line segment connecting (101, 171) to (352, 9).
; PLAN: r0=101(x1), r1=171(y1), r2=352(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 171
LDI r2, 352
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
