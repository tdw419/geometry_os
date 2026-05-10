; DESCRIPTION: Renders a white rectangular region spanning 82 by 30 at (264, 153).
; PLAN: r0=264(x), r1=153(y), r2=82(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 153
LDI r2, 82
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
