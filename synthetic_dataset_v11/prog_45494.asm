; DESCRIPTION: Draws a magenta line from (18, 232) to (108, 242).
; PLAN: r0=18(x1), r1=232(y1), r2=108(x2), r3=242(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 232
LDI r2, 108
LDI r3, 242
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
