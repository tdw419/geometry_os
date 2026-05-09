; DESCRIPTION: Renders a magenta line between points (234, 28) and (231, 209).
; PLAN: r0=234(x1), r1=28(y1), r2=231(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 28
LDI r2, 231
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
