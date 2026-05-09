; DESCRIPTION: Places a orange line segment connecting (217, 111) to (150, 207).
; PLAN: r0=217(x1), r1=111(y1), r2=150(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 111
LDI r2, 150
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
