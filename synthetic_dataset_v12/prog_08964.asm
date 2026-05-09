; DESCRIPTION: Draws a magenta line from (195, 245) to (143, 30).
; PLAN: r0=195(x1), r1=245(y1), r2=143(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 245
LDI r2, 143
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
