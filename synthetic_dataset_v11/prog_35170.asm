; DESCRIPTION: Renders a purple line between points (208, 210) and (214, 231).
; PLAN: r0=208(x1), r1=210(y1), r2=214(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 210
LDI r2, 214
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
