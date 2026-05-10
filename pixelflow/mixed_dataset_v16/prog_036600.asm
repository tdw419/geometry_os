; DESCRIPTION: Places a red line segment connecting (230, 48) to (353, 202).
; PLAN: r0=230(x1), r1=48(y1), r2=353(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 48
LDI r2, 353
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
