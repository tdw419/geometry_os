; DESCRIPTION: Renders a red rectangular region spanning 76 by 37 at (375, 19).
; PLAN: r0=375(x), r1=19(y), r2=76(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 19
LDI r2, 76
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
