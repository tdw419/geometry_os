; DESCRIPTION: Draws a magenta line from (223, 108) to (83, 103).
; PLAN: r0=223(x1), r1=108(y1), r2=83(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 108
LDI r2, 83
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
