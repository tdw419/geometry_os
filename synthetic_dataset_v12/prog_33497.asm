; DESCRIPTION: Renders a white box of size 45x67 starting at (443, 141).
; PLAN: r0=443(x), r1=141(y), r2=45(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 141
LDI r2, 45
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
