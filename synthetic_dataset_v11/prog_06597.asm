; DESCRIPTION: Renders a green box of size 55x69 starting at (47, 109).
; PLAN: r0=47(x), r1=109(y), r2=55(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 109
LDI r2, 55
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
