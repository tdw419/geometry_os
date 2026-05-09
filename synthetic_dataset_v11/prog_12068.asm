; DESCRIPTION: Draws a green line from (20, 15) to (129, 32).
; PLAN: r0=20(x1), r1=15(y1), r2=129(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 15
LDI r2, 129
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
