; DESCRIPTION: Places a red line segment connecting (15, 111) to (161, 167).
; PLAN: r0=15(x1), r1=111(y1), r2=161(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 111
LDI r2, 161
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
