; DESCRIPTION: Draws a green line from (502, 78) to (314, 74).
; PLAN: r0=502(x1), r1=78(y1), r2=314(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 78
LDI r2, 314
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
