; DESCRIPTION: Renders a cyan line between points (252, 232) and (383, 94).
; PLAN: r0=252(x1), r1=232(y1), r2=383(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 232
LDI r2, 383
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
