; DESCRIPTION: Places a cyan line segment connecting (374, 134) to (428, 138).
; PLAN: r0=374(x1), r1=134(y1), r2=428(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 134
LDI r2, 428
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
