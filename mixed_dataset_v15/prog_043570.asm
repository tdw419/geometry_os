; DESCRIPTION: Renders a red box of size 39x58 starting at (239, 165).
; PLAN: r0=239(x), r1=165(y), r2=39(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 165
LDI r2, 39
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
