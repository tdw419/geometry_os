; DESCRIPTION: Draws a black line from (296, 69) to (384, 208).
; PLAN: r0=296(x1), r1=69(y1), r2=384(x2), r3=208(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 69
LDI r2, 384
LDI r3, 208
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
