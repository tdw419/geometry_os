; DESCRIPTION: Renders a blue line between points (183, 154) and (507, 177).
; PLAN: r0=183(x1), r1=154(y1), r2=507(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 154
LDI r2, 507
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
