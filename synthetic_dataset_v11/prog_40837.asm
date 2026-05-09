; DESCRIPTION: Places a cyan line segment connecting (19, 19) to (72, 245).
; PLAN: r0=19(x1), r1=19(y1), r2=72(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 19
LDI r2, 72
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
