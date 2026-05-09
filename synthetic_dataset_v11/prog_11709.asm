; DESCRIPTION: Draws a magenta line from (100, 189) to (50, 60).
; PLAN: r0=100(x1), r1=189(y1), r2=50(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 189
LDI r2, 50
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
