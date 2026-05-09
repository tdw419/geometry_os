; DESCRIPTION: Draws a magenta line from (287, 116) to (157, 50).
; PLAN: r0=287(x1), r1=116(y1), r2=157(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 116
LDI r2, 157
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
