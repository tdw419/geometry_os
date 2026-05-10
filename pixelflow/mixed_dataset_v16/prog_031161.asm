; DESCRIPTION: Renders a white rectangular region spanning 61 by 101 at (50, 173).
; PLAN: r0=50(x), r1=173(y), r2=61(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 173
LDI r2, 61
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
