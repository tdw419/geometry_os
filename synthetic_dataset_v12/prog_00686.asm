; DESCRIPTION: Places a red 53x12 rectangle at position (157, 203).
; PLAN: r0=157(x), r1=203(y), r2=53(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 203
LDI r2, 53
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
