; DESCRIPTION: Places a orange line segment connecting (82, 195) to (90, 114).
; PLAN: r0=82(x1), r1=195(y1), r2=90(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 195
LDI r2, 90
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
