; DESCRIPTION: Draws a white line from (188, 157) to (9, 93).
; PLAN: r0=188(x1), r1=157(y1), r2=9(x2), r3=93(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 157
LDI r2, 9
LDI r3, 93
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
