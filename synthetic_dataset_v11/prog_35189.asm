; DESCRIPTION: Renders a red box of size 64x104 starting at (41, 103).
; PLAN: r0=41(x), r1=103(y), r2=64(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 103
LDI r2, 64
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
