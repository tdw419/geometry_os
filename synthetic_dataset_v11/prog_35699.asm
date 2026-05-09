; DESCRIPTION: Renders a white box of size 76x120 starting at (5, 74).
; PLAN: r0=5(x), r1=74(y), r2=76(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 74
LDI r2, 76
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
