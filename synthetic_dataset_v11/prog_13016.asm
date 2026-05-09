; DESCRIPTION: Renders a orange box of size 38x67 starting at (26, 6).
; PLAN: r0=26(x), r1=6(y), r2=38(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 6
LDI r2, 38
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
