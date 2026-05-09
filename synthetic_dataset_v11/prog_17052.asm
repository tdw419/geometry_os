; DESCRIPTION: Renders a orange box of size 107x76 starting at (67, 77).
; PLAN: r0=67(x), r1=77(y), r2=107(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 77
LDI r2, 107
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
