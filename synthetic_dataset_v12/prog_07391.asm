; DESCRIPTION: Places a cyan line segment connecting (114, 246) to (129, 123).
; PLAN: r0=114(x1), r1=246(y1), r2=129(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 246
LDI r2, 129
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
