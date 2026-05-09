; DESCRIPTION: Renders a purple line between points (283, 154) and (507, 182).
; PLAN: r0=283(x1), r1=154(y1), r2=507(x2), r3=182(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 154
LDI r2, 507
LDI r3, 182
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
