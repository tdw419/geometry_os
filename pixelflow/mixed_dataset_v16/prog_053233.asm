; DESCRIPTION: Renders a red rectangular region spanning 37 by 76 at (122, 63).
; PLAN: r0=122(x), r1=63(y), r2=37(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 63
LDI r2, 37
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
