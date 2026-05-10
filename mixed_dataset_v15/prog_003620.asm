; DESCRIPTION: Draws a green line from (14, 115) to (128, 199).
; PLAN: r0=14(x1), r1=115(y1), r2=128(x2), r3=199(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 115
LDI r2, 128
LDI r3, 199
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
