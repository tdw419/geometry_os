; DESCRIPTION: Renders a orange box of size 103x67 starting at (43, 113).
; PLAN: r0=43(x), r1=113(y), r2=103(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 113
LDI r2, 103
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
