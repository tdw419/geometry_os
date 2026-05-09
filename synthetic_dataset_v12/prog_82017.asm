; DESCRIPTION: Places a cyan line segment connecting (216, 15) to (71, 164).
; PLAN: r0=216(x1), r1=15(y1), r2=71(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 15
LDI r2, 71
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
