; DESCRIPTION: Renders a green line between points (105, 25) and (123, 64).
; PLAN: r0=105(x1), r1=25(y1), r2=123(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 25
LDI r2, 123
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
