; DESCRIPTION: Renders a orange rectangular region spanning 26 by 108 at (239, 77).
; PLAN: r0=239(x), r1=77(y), r2=26(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 77
LDI r2, 26
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
