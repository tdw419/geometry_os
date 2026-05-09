; DESCRIPTION: Places a yellow line segment connecting (107, 63) to (215, 155).
; PLAN: r0=107(x1), r1=63(y1), r2=215(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 63
LDI r2, 215
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
