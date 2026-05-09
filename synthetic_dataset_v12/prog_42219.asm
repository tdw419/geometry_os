; DESCRIPTION: Places a white line segment connecting (41, 28) to (176, 127).
; PLAN: r0=41(x1), r1=28(y1), r2=176(x2), r3=127(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 28
LDI r2, 176
LDI r3, 127
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
