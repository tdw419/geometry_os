; DESCRIPTION: Draws a magenta line from (378, 108) to (487, 61).
; PLAN: r0=378(x1), r1=108(y1), r2=487(x2), r3=61(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 108
LDI r2, 487
LDI r3, 61
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
