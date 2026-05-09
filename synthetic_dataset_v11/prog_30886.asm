; DESCRIPTION: Renders a orange line between points (96, 68) and (197, 103).
; PLAN: r0=96(x1), r1=68(y1), r2=197(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 68
LDI r2, 197
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
