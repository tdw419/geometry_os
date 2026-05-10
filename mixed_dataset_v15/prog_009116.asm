; DESCRIPTION: Places a cyan line segment connecting (261, 183) to (241, 188).
; PLAN: r0=261(x1), r1=183(y1), r2=241(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 183
LDI r2, 241
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
