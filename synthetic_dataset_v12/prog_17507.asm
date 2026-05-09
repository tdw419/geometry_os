; DESCRIPTION: Places a cyan line segment connecting (58, 49) to (53, 232).
; PLAN: r0=58(x1), r1=49(y1), r2=53(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 49
LDI r2, 53
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
