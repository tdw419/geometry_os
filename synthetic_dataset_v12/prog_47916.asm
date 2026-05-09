; DESCRIPTION: Renders a white box of size 92x74 starting at (10, 130).
; PLAN: r0=10(x), r1=130(y), r2=92(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 130
LDI r2, 92
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
