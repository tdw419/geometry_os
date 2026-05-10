; DESCRIPTION: Draws a magenta line from (365, 161) to (190, 10).
; PLAN: r0=365(x1), r1=161(y1), r2=190(x2), r3=10(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 161
LDI r2, 190
LDI r3, 10
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
