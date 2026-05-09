; DESCRIPTION: Places a red 76x35 rectangle at position (29, 130).
; PLAN: r0=29(x), r1=130(y), r2=76(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 130
LDI r2, 76
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
