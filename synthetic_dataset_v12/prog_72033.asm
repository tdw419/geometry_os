; DESCRIPTION: Places a cyan line segment connecting (25, 35) to (435, 229).
; PLAN: r0=25(x1), r1=35(y1), r2=435(x2), r3=229(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 35
LDI r2, 435
LDI r3, 229
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
