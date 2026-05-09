; DESCRIPTION: Places a cyan line segment connecting (261, 198) to (282, 0).
; PLAN: r0=261(x1), r1=198(y1), r2=282(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 198
LDI r2, 282
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
