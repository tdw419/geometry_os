; DESCRIPTION: Renders a green line between points (413, 102) and (208, 101).
; PLAN: r0=413(x1), r1=102(y1), r2=208(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 102
LDI r2, 208
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
