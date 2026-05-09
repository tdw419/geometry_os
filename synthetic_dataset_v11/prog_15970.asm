; DESCRIPTION: Draws a magenta line from (228, 244) to (148, 109).
; PLAN: r0=228(x1), r1=244(y1), r2=148(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 244
LDI r2, 148
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
