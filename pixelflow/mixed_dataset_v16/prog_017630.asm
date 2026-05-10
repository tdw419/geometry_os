; DESCRIPTION: Places a blue line segment connecting (164, 228) to (112, 198).
; PLAN: r0=164(x1), r1=228(y1), r2=112(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 228
LDI r2, 112
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
