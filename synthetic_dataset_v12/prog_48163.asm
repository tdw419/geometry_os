; DESCRIPTION: Renders a orange box of size 26x28 starting at (404, 155).
; PLAN: r0=404(x), r1=155(y), r2=26(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 155
LDI r2, 26
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
