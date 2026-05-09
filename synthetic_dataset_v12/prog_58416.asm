; DESCRIPTION: Draws a black line from (239, 3) to (164, 175).
; PLAN: r0=239(x1), r1=3(y1), r2=164(x2), r3=175(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 3
LDI r2, 164
LDI r3, 175
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
