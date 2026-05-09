; DESCRIPTION: Places a orange line segment connecting (197, 24) to (28, 29).
; PLAN: r0=197(x1), r1=24(y1), r2=28(x2), r3=29(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 24
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
