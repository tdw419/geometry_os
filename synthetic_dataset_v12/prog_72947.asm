; DESCRIPTION: Places a red line segment connecting (44, 122) to (23, 210).
; PLAN: r0=44(x1), r1=122(y1), r2=23(x2), r3=210(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 122
LDI r2, 23
LDI r3, 210
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
