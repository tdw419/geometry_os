; DESCRIPTION: Places a red line segment connecting (182, 69) to (294, 1).
; PLAN: r0=182(x1), r1=69(y1), r2=294(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 69
LDI r2, 294
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
