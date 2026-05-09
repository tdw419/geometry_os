; DESCRIPTION: Draws a magenta line from (12, 243) to (439, 66).
; PLAN: r0=12(x1), r1=243(y1), r2=439(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 243
LDI r2, 439
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
