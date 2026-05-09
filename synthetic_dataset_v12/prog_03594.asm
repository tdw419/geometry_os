; DESCRIPTION: Renders a orange box of size 82x38 starting at (181, 165).
; PLAN: r0=181(x), r1=165(y), r2=82(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 165
LDI r2, 82
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
