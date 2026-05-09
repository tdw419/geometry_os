; DESCRIPTION: Renders a red line between points (507, 131) and (307, 49).
; PLAN: r0=507(x1), r1=131(y1), r2=307(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 131
LDI r2, 307
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
