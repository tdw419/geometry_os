; DESCRIPTION: Places a black line segment connecting (134, 148) to (150, 125).
; PLAN: r0=134(x1), r1=148(y1), r2=150(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 148
LDI r2, 150
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
