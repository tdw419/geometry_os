; DESCRIPTION: Places a blue line segment connecting (171, 39) to (154, 200).
; PLAN: r0=171(x1), r1=39(y1), r2=154(x2), r3=200(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 39
LDI r2, 154
LDI r3, 200
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
