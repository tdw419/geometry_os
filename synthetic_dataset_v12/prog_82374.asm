; DESCRIPTION: Places a cyan line segment connecting (6, 5) to (332, 11).
; PLAN: r0=6(x1), r1=5(y1), r2=332(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 5
LDI r2, 332
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
