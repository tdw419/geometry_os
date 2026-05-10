; DESCRIPTION: Renders a orange box of size 46x43 starting at (108, 195).
; PLAN: r0=108(x), r1=195(y), r2=46(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 195
LDI r2, 46
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
