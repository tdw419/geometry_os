; DESCRIPTION: Renders a orange rectangular region spanning 116 by 28 at (279, 158).
; PLAN: r0=279(x), r1=158(y), r2=116(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 158
LDI r2, 116
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
