; DESCRIPTION: Renders a orange line between points (114, 196) and (412, 157).
; PLAN: r0=114(x1), r1=196(y1), r2=412(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 196
LDI r2, 412
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
