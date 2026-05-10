; DESCRIPTION: Places a black 69x100 rectangle at position (306, 106).
; PLAN: r0=306(x), r1=106(y), r2=69(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 106
LDI r2, 69
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
