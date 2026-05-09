; DESCRIPTION: Draws a green line from (440, 157) to (119, 95).
; PLAN: r0=440(x1), r1=157(y1), r2=119(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 157
LDI r2, 119
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
