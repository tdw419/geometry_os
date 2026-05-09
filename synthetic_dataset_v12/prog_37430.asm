; DESCRIPTION: Places a white line segment connecting (510, 81) to (392, 41).
; PLAN: r0=510(x1), r1=81(y1), r2=392(x2), r3=41(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 510
LDI r1, 81
LDI r2, 392
LDI r3, 41
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
