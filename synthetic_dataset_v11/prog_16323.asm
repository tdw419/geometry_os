; DESCRIPTION: Places a red 69x96 rectangle at position (122, 47).
; PLAN: r0=122(x), r1=47(y), r2=69(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 47
LDI r2, 69
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
