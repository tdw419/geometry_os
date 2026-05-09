; DESCRIPTION: Places a cyan line segment connecting (5, 199) to (20, 109).
; PLAN: r0=5(x1), r1=199(y1), r2=20(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 199
LDI r2, 20
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
