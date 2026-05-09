; DESCRIPTION: Renders a yellow line between points (215, 87) and (29, 153).
; PLAN: r0=215(x1), r1=87(y1), r2=29(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 87
LDI r2, 29
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
