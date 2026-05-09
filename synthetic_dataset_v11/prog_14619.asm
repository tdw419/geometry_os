; DESCRIPTION: Renders a magenta line between points (151, 80) and (67, 231).
; PLAN: r0=151(x1), r1=80(y1), r2=67(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 80
LDI r2, 67
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
