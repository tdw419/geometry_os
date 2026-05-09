; DESCRIPTION: Places a red 69x78 rectangle at position (248, 148).
; PLAN: r0=248(x), r1=148(y), r2=69(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 148
LDI r2, 69
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
