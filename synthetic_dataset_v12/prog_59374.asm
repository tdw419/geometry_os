; DESCRIPTION: Places a cyan line segment connecting (9, 216) to (488, 90).
; PLAN: r0=9(x1), r1=216(y1), r2=488(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 216
LDI r2, 488
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
