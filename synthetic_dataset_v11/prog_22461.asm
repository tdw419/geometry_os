; DESCRIPTION: Renders a white box of size 38x76 starting at (154, 122).
; PLAN: r0=154(x), r1=122(y), r2=38(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 122
LDI r2, 38
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
