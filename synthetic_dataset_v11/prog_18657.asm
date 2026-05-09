; DESCRIPTION: Places a red 53x12 rectangle at position (130, 119).
; PLAN: r0=130(x), r1=119(y), r2=53(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 119
LDI r2, 53
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
