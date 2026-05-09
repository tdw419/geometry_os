; DESCRIPTION: Renders a orange box of size 50x12 starting at (52, 67).
; PLAN: r0=52(x), r1=67(y), r2=50(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 67
LDI r2, 50
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
