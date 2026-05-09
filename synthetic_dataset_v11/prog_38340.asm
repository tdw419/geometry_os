; DESCRIPTION: Renders a magenta line between points (175, 13) and (179, 167).
; PLAN: r0=175(x1), r1=13(y1), r2=179(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 13
LDI r2, 179
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
