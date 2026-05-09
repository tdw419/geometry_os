; DESCRIPTION: Places a magenta line segment connecting (389, 120) to (284, 133).
; PLAN: r0=389(x1), r1=120(y1), r2=284(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 120
LDI r2, 284
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
