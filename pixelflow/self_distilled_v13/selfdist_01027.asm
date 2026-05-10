; DESCRIPTION: Renders a red rectangular region spanning 53 by 88 at (393, 107).
; PLAN: r0=393(x), r1=107(y), r2=53(width), r3=88(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 107
LDI r2, 53
LDI r3, 88
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
