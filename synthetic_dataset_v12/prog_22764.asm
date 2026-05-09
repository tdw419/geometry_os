; DESCRIPTION: Places a cyan line segment connecting (452, 67) to (85, 138).
; PLAN: r0=452(x1), r1=67(y1), r2=85(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 67
LDI r2, 85
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
