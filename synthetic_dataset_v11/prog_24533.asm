; DESCRIPTION: Places a red line segment connecting (33, 108) to (53, 167).
; PLAN: r0=33(x1), r1=108(y1), r2=53(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 108
LDI r2, 53
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
