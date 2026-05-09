; DESCRIPTION: Renders a orange box of size 84x22 starting at (239, 46).
; PLAN: r0=239(x), r1=46(y), r2=84(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 46
LDI r2, 84
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
