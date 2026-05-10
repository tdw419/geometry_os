; DESCRIPTION: Renders a purple rectangular region spanning 63 by 43 at (198, 136).
; PLAN: r0=198(x), r1=136(y), r2=63(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 136
LDI r2, 63
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
