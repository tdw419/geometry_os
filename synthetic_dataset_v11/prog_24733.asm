; DESCRIPTION: Renders a magenta line between points (32, 157) and (231, 124).
; PLAN: r0=32(x1), r1=157(y1), r2=231(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 157
LDI r2, 231
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
