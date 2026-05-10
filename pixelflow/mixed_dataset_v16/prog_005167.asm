; DESCRIPTION: Draws a green line from (250, 30) to (346, 118).
; PLAN: r0=250(x1), r1=30(y1), r2=346(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 30
LDI r2, 346
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
