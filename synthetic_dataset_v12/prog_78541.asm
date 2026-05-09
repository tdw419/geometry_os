; DESCRIPTION: Draws a cyan line from (14, 113) to (314, 13).
; PLAN: r0=14(x1), r1=113(y1), r2=314(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 113
LDI r2, 314
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
