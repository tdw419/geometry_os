; DESCRIPTION: Draws a green line from (239, 101) to (130, 141).
; PLAN: r0=239(x1), r1=101(y1), r2=130(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 101
LDI r2, 130
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
