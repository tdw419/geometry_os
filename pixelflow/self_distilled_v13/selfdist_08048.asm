; DESCRIPTION: Renders a red rectangular region spanning 50 by 24 at (354, 53).
; PLAN: r0=354(x), r1=53(y), r2=50(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 53
LDI r2, 50
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
