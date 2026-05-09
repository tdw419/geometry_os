; DESCRIPTION: Places a cyan line segment connecting (35, 147) to (122, 67).
; PLAN: r0=35(x1), r1=147(y1), r2=122(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 147
LDI r2, 122
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
