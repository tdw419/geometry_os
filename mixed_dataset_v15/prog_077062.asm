; DESCRIPTION: Places a yellow line segment connecting (82, 188) to (417, 234).
; PLAN: r0=82(x1), r1=188(y1), r2=417(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 188
LDI r2, 417
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
