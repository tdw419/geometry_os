; DESCRIPTION: Renders a purple line between points (202, 215) and (123, 102).
; PLAN: r0=202(x1), r1=215(y1), r2=123(x2), r3=102(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 215
LDI r2, 123
LDI r3, 102
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
