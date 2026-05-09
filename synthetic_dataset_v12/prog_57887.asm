; DESCRIPTION: Draws a magenta line from (383, 212) to (138, 161).
; PLAN: r0=383(x1), r1=212(y1), r2=138(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 212
LDI r2, 138
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
