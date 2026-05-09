; DESCRIPTION: Places a white line segment connecting (200, 230) to (446, 212).
; PLAN: r0=200(x1), r1=230(y1), r2=446(x2), r3=212(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 230
LDI r2, 446
LDI r3, 212
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
