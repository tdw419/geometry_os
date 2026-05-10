; DESCRIPTION: Renders a white rectangular region spanning 76 by 101 at (108, 138).
; PLAN: r0=108(x), r1=138(y), r2=76(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 138
LDI r2, 76
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
