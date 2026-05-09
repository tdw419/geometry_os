; DESCRIPTION: Renders a red line between points (252, 237) and (208, 234).
; PLAN: r0=252(x1), r1=237(y1), r2=208(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 237
LDI r2, 208
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
