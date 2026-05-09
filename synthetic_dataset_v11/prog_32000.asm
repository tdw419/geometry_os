; DESCRIPTION: Draws a magenta line from (21, 154) to (134, 120).
; PLAN: r0=21(x1), r1=154(y1), r2=134(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 154
LDI r2, 134
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
