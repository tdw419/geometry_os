; DESCRIPTION: Draws a magenta line from (82, 82) to (483, 231).
; PLAN: r0=82(x1), r1=82(y1), r2=483(x2), r3=231(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 82
LDI r2, 483
LDI r3, 231
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
