; DESCRIPTION: Places a cyan line segment connecting (211, 121) to (230, 227).
; PLAN: r0=211(x1), r1=121(y1), r2=230(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 121
LDI r2, 230
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
