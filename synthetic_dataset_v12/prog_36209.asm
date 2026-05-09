; DESCRIPTION: Renders a magenta line between points (297, 59) and (16, 25).
; PLAN: r0=297(x1), r1=59(y1), r2=16(x2), r3=25(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 59
LDI r2, 16
LDI r3, 25
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
