; DESCRIPTION: Places a red 68x83 rectangle at position (2, 122).
; PLAN: r0=2(x), r1=122(y), r2=68(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 122
LDI r2, 68
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
