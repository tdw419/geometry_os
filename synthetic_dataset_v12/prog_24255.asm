; DESCRIPTION: Places a magenta line segment connecting (197, 36) to (223, 24).
; PLAN: r0=197(x1), r1=36(y1), r2=223(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 36
LDI r2, 223
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
