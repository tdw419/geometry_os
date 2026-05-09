; DESCRIPTION: Renders a white box of size 108x17 starting at (161, 28).
; PLAN: r0=161(x), r1=28(y), r2=108(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 28
LDI r2, 108
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
