; DESCRIPTION: Renders a white box of size 53x82 starting at (102, 21).
; PLAN: r0=102(x), r1=21(y), r2=53(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 21
LDI r2, 53
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
