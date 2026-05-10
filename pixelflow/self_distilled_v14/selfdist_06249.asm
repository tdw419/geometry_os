; DESCRIPTION: Renders a red rectangular region spanning 69 by 120 at (251, 69).
; PLAN: r0=251(x), r1=69(y), r2=69(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 69
LDI r2, 69
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
