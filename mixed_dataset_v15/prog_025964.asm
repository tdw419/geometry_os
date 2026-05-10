; DESCRIPTION: Renders a orange rectangular region spanning 100 by 86 at (212, 194).
; PLAN: r0=212(x), r1=194(y), r2=100(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 194
LDI r2, 100
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
