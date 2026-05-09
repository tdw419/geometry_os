; DESCRIPTION: Places a red 83x69 rectangle at position (306, 61).
; PLAN: r0=306(x), r1=61(y), r2=83(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 61
LDI r2, 83
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
