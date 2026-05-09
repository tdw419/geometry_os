; DESCRIPTION: Renders a orange box of size 38x82 starting at (160, 62).
; PLAN: r0=160(x), r1=62(y), r2=38(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 62
LDI r2, 38
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
