; DESCRIPTION: Places a red line segment connecting (494, 109) to (401, 30).
; PLAN: r0=494(x1), r1=109(y1), r2=401(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 109
LDI r2, 401
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
