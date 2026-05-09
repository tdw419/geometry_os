; DESCRIPTION: Places a cyan line segment connecting (227, 230) to (209, 149).
; PLAN: r0=227(x1), r1=230(y1), r2=209(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 230
LDI r2, 209
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
