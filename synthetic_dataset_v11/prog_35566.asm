; DESCRIPTION: Places a red line segment connecting (34, 164) to (196, 167).
; PLAN: r0=34(x1), r1=164(y1), r2=196(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 164
LDI r2, 196
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
