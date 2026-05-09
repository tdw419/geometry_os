; DESCRIPTION: Draws a green line from (115, 20) to (182, 181).
; PLAN: r0=115(x1), r1=20(y1), r2=182(x2), r3=181(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 20
LDI r2, 182
LDI r3, 181
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
