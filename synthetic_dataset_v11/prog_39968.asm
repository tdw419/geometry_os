; DESCRIPTION: Places a white 119x36 rectangle at position (81, 122).
; PLAN: r0=81(x), r1=122(y), r2=119(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 122
LDI r2, 119
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
