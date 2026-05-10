; DESCRIPTION: Renders a white box of size 76x92 starting at (154, 106).
; PLAN: r0=154(x), r1=106(y), r2=76(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 106
LDI r2, 76
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
