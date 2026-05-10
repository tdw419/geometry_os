; DESCRIPTION: Places a white line segment connecting (352, 4) to (406, 43).
; PLAN: r0=352(x1), r1=4(y1), r2=406(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 4
LDI r2, 406
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
