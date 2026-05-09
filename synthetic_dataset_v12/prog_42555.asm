; DESCRIPTION: Places a cyan line segment connecting (105, 134) to (200, 14).
; PLAN: r0=105(x1), r1=134(y1), r2=200(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 134
LDI r2, 200
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
