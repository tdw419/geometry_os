; DESCRIPTION: Draws a yellow line from (239, 58) to (402, 134).
; PLAN: r0=239(x1), r1=58(y1), r2=402(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 58
LDI r2, 402
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
