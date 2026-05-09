; DESCRIPTION: Draws a green line from (171, 53) to (119, 176).
; PLAN: r0=171(x1), r1=53(y1), r2=119(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 53
LDI r2, 119
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
