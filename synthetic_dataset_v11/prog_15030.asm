; DESCRIPTION: Renders a orange box of size 69x103 starting at (171, 38).
; PLAN: r0=171(x), r1=38(y), r2=69(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 38
LDI r2, 69
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
