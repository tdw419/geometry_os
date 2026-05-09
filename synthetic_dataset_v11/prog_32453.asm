; DESCRIPTION: Renders a orange line between points (153, 206) and (101, 103).
; PLAN: r0=153(x1), r1=206(y1), r2=101(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 206
LDI r2, 101
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
