; DESCRIPTION: Places a red 26x76 rectangle at position (40, 36).
; PLAN: r0=40(x), r1=36(y), r2=26(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 36
LDI r2, 26
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
