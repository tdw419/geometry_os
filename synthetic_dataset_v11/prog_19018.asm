; DESCRIPTION: Places a cyan line segment connecting (139, 14) to (230, 32).
; PLAN: r0=139(x1), r1=14(y1), r2=230(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 14
LDI r2, 230
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
