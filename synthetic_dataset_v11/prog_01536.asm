; DESCRIPTION: Renders a green line between points (80, 96) and (5, 204).
; PLAN: r0=80(x1), r1=96(y1), r2=5(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 96
LDI r2, 5
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
