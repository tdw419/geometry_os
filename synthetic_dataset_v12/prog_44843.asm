; DESCRIPTION: Places a red 62x40 rectangle at position (104, 203).
; PLAN: r0=104(x), r1=203(y), r2=62(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 203
LDI r2, 62
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
