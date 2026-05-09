; DESCRIPTION: Places a cyan line segment connecting (358, 176) to (122, 225).
; PLAN: r0=358(x1), r1=176(y1), r2=122(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 176
LDI r2, 122
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
