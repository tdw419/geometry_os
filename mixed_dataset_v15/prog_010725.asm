; DESCRIPTION: Renders a orange rectangular region spanning 84 by 103 at (286, 147).
; PLAN: r0=286(x), r1=147(y), r2=84(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 147
LDI r2, 84
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
