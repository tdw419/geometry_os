; DESCRIPTION: Places a green line segment connecting (174, 238) to (352, 19).
; PLAN: r0=174(x1), r1=238(y1), r2=352(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 238
LDI r2, 352
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
