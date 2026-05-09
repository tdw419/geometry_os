; DESCRIPTION: Places a purple line segment connecting (295, 10) to (339, 241).
; PLAN: r0=295(x1), r1=10(y1), r2=339(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 10
LDI r2, 339
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
