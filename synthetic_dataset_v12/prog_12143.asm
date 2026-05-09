; DESCRIPTION: Draws a magenta line from (299, 45) to (458, 227).
; PLAN: r0=299(x1), r1=45(y1), r2=458(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 45
LDI r2, 458
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
