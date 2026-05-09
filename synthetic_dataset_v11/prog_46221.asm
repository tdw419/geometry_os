; DESCRIPTION: Renders a white box of size 46x50 starting at (88, 148).
; PLAN: r0=88(x), r1=148(y), r2=46(width), r3=50(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 148
LDI r2, 46
LDI r3, 50
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
