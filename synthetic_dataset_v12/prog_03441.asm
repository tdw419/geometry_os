; DESCRIPTION: Places a red 76x101 rectangle at position (18, 137).
; PLAN: r0=18(x), r1=137(y), r2=76(width), r3=101(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 137
LDI r2, 76
LDI r3, 101
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
