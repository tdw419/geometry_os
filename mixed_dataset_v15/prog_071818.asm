; DESCRIPTION: Renders a magenta line between points (504, 208) and (194, 184).
; PLAN: r0=504(x1), r1=208(y1), r2=194(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 208
LDI r2, 194
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
