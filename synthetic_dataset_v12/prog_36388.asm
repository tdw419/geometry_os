; DESCRIPTION: Renders a magenta line between points (75, 97) and (67, 1).
; PLAN: r0=75(x1), r1=97(y1), r2=67(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 97
LDI r2, 67
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
