; DESCRIPTION: Places a cyan line segment connecting (31, 130) to (405, 35).
; PLAN: r0=31(x1), r1=130(y1), r2=405(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 130
LDI r2, 405
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
