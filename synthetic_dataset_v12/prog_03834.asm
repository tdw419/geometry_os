; DESCRIPTION: Draws a magenta line from (164, 88) to (238, 24).
; PLAN: r0=164(x1), r1=88(y1), r2=238(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 88
LDI r2, 238
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
