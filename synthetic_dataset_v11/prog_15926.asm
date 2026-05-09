; DESCRIPTION: Renders a orange box of size 11x82 starting at (140, 147).
; PLAN: r0=140(x), r1=147(y), r2=11(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 147
LDI r2, 11
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
