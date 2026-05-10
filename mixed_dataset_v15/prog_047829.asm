; DESCRIPTION: Renders a white rectangular region spanning 109 by 67 at (287, 24).
; PLAN: r0=287(x), r1=24(y), r2=109(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 24
LDI r2, 109
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
