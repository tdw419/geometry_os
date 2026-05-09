; DESCRIPTION: Places a cyan line segment connecting (230, 141) to (341, 31).
; PLAN: r0=230(x1), r1=141(y1), r2=341(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 141
LDI r2, 341
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
