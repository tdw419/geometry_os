; DESCRIPTION: Places a white 81x43 rectangle at position (207, 162).
; PLAN: r0=207(x), r1=162(y), r2=81(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 162
LDI r2, 81
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
