; DESCRIPTION: Draws a magenta line from (184, 139) to (223, 176).
; PLAN: r0=184(x1), r1=139(y1), r2=223(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 139
LDI r2, 223
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
