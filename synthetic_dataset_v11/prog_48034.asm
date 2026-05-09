; DESCRIPTION: Draws a magenta line from (197, 108) to (46, 156).
; PLAN: r0=197(x1), r1=108(y1), r2=46(x2), r3=156(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 108
LDI r2, 46
LDI r3, 156
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
