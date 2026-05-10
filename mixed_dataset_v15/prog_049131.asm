; DESCRIPTION: Renders a magenta line between points (13, 128) and (442, 249).
; PLAN: r0=13(x1), r1=128(y1), r2=442(x2), r3=249(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 128
LDI r2, 442
LDI r3, 249
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
