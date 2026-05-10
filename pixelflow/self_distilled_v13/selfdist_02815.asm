; DESCRIPTION: Renders a red rectangular region spanning 39 by 69 at (11, 125).
; PLAN: r0=11(x), r1=125(y), r2=39(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 125
LDI r2, 39
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
