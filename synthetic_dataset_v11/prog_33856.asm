; DESCRIPTION: Renders a orange box of size 24x113 starting at (74, 74).
; PLAN: r0=74(x), r1=74(y), r2=24(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 74
LDI r2, 24
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
