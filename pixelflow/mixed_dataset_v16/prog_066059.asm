; DESCRIPTION: Renders a orange box of size 69x47 starting at (385, 136).
; PLAN: r0=385(x), r1=136(y), r2=69(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 136
LDI r2, 69
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
