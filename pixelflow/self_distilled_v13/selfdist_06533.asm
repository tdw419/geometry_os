; DESCRIPTION: Renders a orange rectangular region spanning 98 by 37 at (118, 88).
; PLAN: r0=118(x), r1=88(y), r2=98(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 88
LDI r2, 98
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
