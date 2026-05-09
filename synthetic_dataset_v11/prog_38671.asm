; DESCRIPTION: Draws a magenta line from (50, 126) to (139, 172).
; PLAN: r0=50(x1), r1=126(y1), r2=139(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 126
LDI r2, 139
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
