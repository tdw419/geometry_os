; DESCRIPTION: Draws a green line from (218, 78) to (375, 53).
; PLAN: r0=218(x1), r1=78(y1), r2=375(x2), r3=53(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 78
LDI r2, 375
LDI r3, 53
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
