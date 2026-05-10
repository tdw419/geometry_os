; DESCRIPTION: Renders a orange rectangular region spanning 108 by 86 at (131, 191).
; PLAN: r0=131(x), r1=191(y), r2=108(width), r3=86(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 191
LDI r2, 108
LDI r3, 86
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
