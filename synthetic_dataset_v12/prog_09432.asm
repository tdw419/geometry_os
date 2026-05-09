; DESCRIPTION: Places a cyan line segment connecting (291, 8) to (466, 250).
; PLAN: r0=291(x1), r1=8(y1), r2=466(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 8
LDI r2, 466
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
