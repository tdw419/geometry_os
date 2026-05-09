; DESCRIPTION: Renders a orange box of size 59x24 starting at (108, 178).
; PLAN: r0=108(x), r1=178(y), r2=59(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 178
LDI r2, 59
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
