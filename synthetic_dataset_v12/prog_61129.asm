; DESCRIPTION: Places a cyan line segment connecting (448, 160) to (117, 249).
; PLAN: r0=448(x1), r1=160(y1), r2=117(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 160
LDI r2, 117
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
