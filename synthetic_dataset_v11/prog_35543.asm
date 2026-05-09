; DESCRIPTION: Draws a black line from (214, 83) to (188, 113).
; PLAN: r0=214(x1), r1=83(y1), r2=188(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 83
LDI r2, 188
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
