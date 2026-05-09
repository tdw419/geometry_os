; DESCRIPTION: Places a cyan line segment connecting (451, 208) to (215, 225).
; PLAN: r0=451(x1), r1=208(y1), r2=215(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 208
LDI r2, 215
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
