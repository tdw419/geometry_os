; DESCRIPTION: Renders a magenta line between points (144, 128) and (124, 135).
; PLAN: r0=144(x1), r1=128(y1), r2=124(x2), r3=135(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 128
LDI r2, 124
LDI r3, 135
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
