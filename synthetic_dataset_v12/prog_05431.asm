; DESCRIPTION: Draws a black line from (239, 86) to (266, 229).
; PLAN: r0=239(x1), r1=86(y1), r2=266(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 86
LDI r2, 266
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
