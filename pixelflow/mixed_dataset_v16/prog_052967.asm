; DESCRIPTION: Draws a magenta line from (117, 179) to (120, 126).
; PLAN: r0=117(x1), r1=179(y1), r2=120(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 179
LDI r2, 120
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
