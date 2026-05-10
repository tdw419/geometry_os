; DESCRIPTION: Renders a orange rectangular region spanning 105 by 70 at (231, 194).
; PLAN: r0=231(x), r1=194(y), r2=105(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 194
LDI r2, 105
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
