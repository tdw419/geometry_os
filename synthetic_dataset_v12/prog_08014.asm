; DESCRIPTION: Places a black line segment connecting (43, 197) to (234, 29).
; PLAN: r0=43(x1), r1=197(y1), r2=234(x2), r3=29(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 197
LDI r2, 234
LDI r3, 29
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
