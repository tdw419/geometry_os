; DESCRIPTION: Renders a orange box of size 108x115 starting at (47, 59).
; PLAN: r0=47(x), r1=59(y), r2=108(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 59
LDI r2, 108
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
