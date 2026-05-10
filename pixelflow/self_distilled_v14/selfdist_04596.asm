; DESCRIPTION: Draws a green line from (95, 30) to (24, 20).
; PLAN: r0=95(x1), r1=30(y1), r2=24(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 30
LDI r2, 24
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
