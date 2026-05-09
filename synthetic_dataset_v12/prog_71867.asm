; DESCRIPTION: Draws a magenta line from (294, 142) to (211, 108).
; PLAN: r0=294(x1), r1=142(y1), r2=211(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 142
LDI r2, 211
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
