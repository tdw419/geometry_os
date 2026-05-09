; DESCRIPTION: Draws a magenta line from (23, 108) to (237, 29).
; PLAN: r0=23(x1), r1=108(y1), r2=237(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 108
LDI r2, 237
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
