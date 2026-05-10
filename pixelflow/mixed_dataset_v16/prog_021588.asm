; DESCRIPTION: Places a red line segment connecting (401, 17) to (67, 114).
; PLAN: r0=401(x1), r1=17(y1), r2=67(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 17
LDI r2, 67
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
