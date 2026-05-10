; DESCRIPTION: Renders a white box of size 67x76 starting at (434, 167).
; PLAN: r0=434(x), r1=167(y), r2=67(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 167
LDI r2, 67
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
