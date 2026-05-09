; DESCRIPTION: Renders a orange box of size 33x88 starting at (120, 59).
; PLAN: r0=120(x), r1=59(y), r2=33(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 59
LDI r2, 33
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
