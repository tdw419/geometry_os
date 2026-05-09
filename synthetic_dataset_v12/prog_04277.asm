; DESCRIPTION: Places a red line segment connecting (245, 69) to (401, 15).
; PLAN: r0=245(x1), r1=69(y1), r2=401(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 69
LDI r2, 401
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
