; DESCRIPTION: Renders a orange box of size 64x49 starting at (20, 67).
; PLAN: r0=20(x), r1=67(y), r2=64(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 67
LDI r2, 64
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
