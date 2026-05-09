; DESCRIPTION: Renders a green line between points (420, 131) and (135, 205).
; PLAN: r0=420(x1), r1=131(y1), r2=135(x2), r3=205(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 131
LDI r2, 135
LDI r3, 205
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
