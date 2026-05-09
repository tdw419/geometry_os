; DESCRIPTION: Renders a orange box of size 18x67 starting at (90, 4).
; PLAN: r0=90(x), r1=4(y), r2=18(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 4
LDI r2, 18
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
