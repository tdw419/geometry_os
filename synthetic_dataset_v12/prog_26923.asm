; DESCRIPTION: Places a blue line segment connecting (130, 121) to (434, 117).
; PLAN: r0=130(x1), r1=121(y1), r2=434(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 121
LDI r2, 434
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
