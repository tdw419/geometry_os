; DESCRIPTION: Renders a magenta line between points (252, 153) and (206, 55).
; PLAN: r0=252(x1), r1=153(y1), r2=206(x2), r3=55(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 153
LDI r2, 206
LDI r3, 55
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
