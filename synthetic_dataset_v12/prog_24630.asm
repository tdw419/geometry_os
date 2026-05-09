; DESCRIPTION: Places a green line segment connecting (133, 228) to (160, 163).
; PLAN: r0=133(x1), r1=228(y1), r2=160(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 228
LDI r2, 160
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
