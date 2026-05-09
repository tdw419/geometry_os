; DESCRIPTION: Draws a magenta line from (184, 250) to (271, 44).
; PLAN: r0=184(x1), r1=250(y1), r2=271(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 250
LDI r2, 271
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
