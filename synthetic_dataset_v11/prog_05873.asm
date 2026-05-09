; DESCRIPTION: Draws a white line from (26, 153) to (210, 188).
; PLAN: r0=26(x1), r1=153(y1), r2=210(x2), r3=188(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 153
LDI r2, 210
LDI r3, 188
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
