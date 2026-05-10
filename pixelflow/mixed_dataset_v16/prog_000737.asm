; DESCRIPTION: Places a black line segment connecting (125, 167) to (207, 166).
; PLAN: r0=125(x1), r1=167(y1), r2=207(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 167
LDI r2, 207
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
