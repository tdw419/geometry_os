; DESCRIPTION: Places a black line segment connecting (70, 114) to (143, 209).
; PLAN: r0=70(x1), r1=114(y1), r2=143(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 114
LDI r2, 143
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
