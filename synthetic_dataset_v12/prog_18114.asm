; DESCRIPTION: Places a black line segment connecting (315, 10) to (175, 125).
; PLAN: r0=315(x1), r1=10(y1), r2=175(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 10
LDI r2, 175
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
