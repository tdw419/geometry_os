; DESCRIPTION: Draws a magenta line from (100, 126) to (82, 200).
; PLAN: r0=100(x1), r1=126(y1), r2=82(x2), r3=200(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 126
LDI r2, 82
LDI r3, 200
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
