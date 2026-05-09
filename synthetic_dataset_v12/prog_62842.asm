; DESCRIPTION: Renders a magenta line between points (309, 122) and (418, 14).
; PLAN: r0=309(x1), r1=122(y1), r2=418(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 122
LDI r2, 418
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
