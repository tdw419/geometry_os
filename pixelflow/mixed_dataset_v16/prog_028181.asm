; DESCRIPTION: Renders a orange rectangular region spanning 108 by 28 at (147, 65).
; PLAN: r0=147(x), r1=65(y), r2=108(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 65
LDI r2, 108
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
