; DESCRIPTION: Draws a black line from (30, 23) to (239, 123).
; PLAN: r0=30(x1), r1=23(y1), r2=239(x2), r3=123(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 23
LDI r2, 239
LDI r3, 123
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
