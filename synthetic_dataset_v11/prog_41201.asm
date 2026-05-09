; DESCRIPTION: Places a red line segment connecting (186, 164) to (196, 151).
; PLAN: r0=186(x1), r1=164(y1), r2=196(x2), r3=151(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 164
LDI r2, 196
LDI r3, 151
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
