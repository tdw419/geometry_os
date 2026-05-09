; DESCRIPTION: Draws a black line from (330, 155) to (239, 146).
; PLAN: r0=330(x1), r1=155(y1), r2=239(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 155
LDI r2, 239
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
