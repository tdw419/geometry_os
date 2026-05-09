; DESCRIPTION: Renders a magenta line between points (44, 157) and (23, 198).
; PLAN: r0=44(x1), r1=157(y1), r2=23(x2), r3=198(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 157
LDI r2, 23
LDI r3, 198
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
