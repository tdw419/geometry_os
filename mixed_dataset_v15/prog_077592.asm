; DESCRIPTION: Renders a white box of size 11x82 starting at (79, 0).
; PLAN: r0=79(x), r1=0(y), r2=11(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 0
LDI r2, 11
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
