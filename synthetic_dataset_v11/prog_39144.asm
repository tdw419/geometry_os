; DESCRIPTION: Places a cyan line segment connecting (204, 54) to (161, 30).
; PLAN: r0=204(x1), r1=54(y1), r2=161(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 54
LDI r2, 161
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
