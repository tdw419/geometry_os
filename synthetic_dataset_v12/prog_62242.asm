; DESCRIPTION: Places a cyan line segment connecting (349, 216) to (360, 195).
; PLAN: r0=349(x1), r1=216(y1), r2=360(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 216
LDI r2, 360
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
