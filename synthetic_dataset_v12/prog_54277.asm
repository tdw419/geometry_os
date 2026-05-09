; DESCRIPTION: Renders a magenta line between points (328, 206) and (153, 54).
; PLAN: r0=328(x1), r1=206(y1), r2=153(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 206
LDI r2, 153
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
