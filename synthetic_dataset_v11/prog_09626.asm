; DESCRIPTION: Draws a magenta line from (231, 12) to (82, 6).
; PLAN: r0=231(x1), r1=12(y1), r2=82(x2), r3=6(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 12
LDI r2, 82
LDI r3, 6
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
