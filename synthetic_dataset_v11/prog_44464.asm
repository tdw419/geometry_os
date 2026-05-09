; DESCRIPTION: Renders a yellow line between points (172, 214) and (247, 186).
; PLAN: r0=172(x1), r1=214(y1), r2=247(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 214
LDI r2, 247
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
