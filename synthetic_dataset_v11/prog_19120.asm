; DESCRIPTION: Places a cyan line segment connecting (5, 180) to (62, 20).
; PLAN: r0=5(x1), r1=180(y1), r2=62(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 180
LDI r2, 62
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
