; DESCRIPTION: Places a cyan line segment connecting (262, 200) to (21, 211).
; PLAN: r0=262(x1), r1=200(y1), r2=21(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 200
LDI r2, 21
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
