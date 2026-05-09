; DESCRIPTION: Renders a white box of size 12x83 starting at (488, 148).
; PLAN: r0=488(x), r1=148(y), r2=12(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 148
LDI r2, 12
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
