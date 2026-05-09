; DESCRIPTION: Places a orange line segment connecting (306, 27) to (197, 254).
; PLAN: r0=306(x1), r1=27(y1), r2=197(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 27
LDI r2, 197
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
