; DESCRIPTION: Renders a orange rectangular region spanning 91 by 36 at (101, 5).
; PLAN: r0=101(x), r1=5(y), r2=91(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 5
LDI r2, 91
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
