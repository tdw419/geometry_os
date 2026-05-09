; DESCRIPTION: Draws a green line from (206, 130) to (232, 10).
; PLAN: r0=206(x1), r1=130(y1), r2=232(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 130
LDI r2, 232
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
