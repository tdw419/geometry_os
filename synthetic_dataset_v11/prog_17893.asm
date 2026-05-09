; DESCRIPTION: Renders a green line between points (148, 208) and (118, 173).
; PLAN: r0=148(x1), r1=208(y1), r2=118(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 208
LDI r2, 118
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
