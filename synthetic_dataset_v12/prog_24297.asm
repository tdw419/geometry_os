; DESCRIPTION: Renders a green line between points (208, 169) and (346, 179).
; PLAN: r0=208(x1), r1=169(y1), r2=346(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 169
LDI r2, 346
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
