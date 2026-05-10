; DESCRIPTION: Places a white 68x36 rectangle at position (259, 203).
; PLAN: r0=259(x), r1=203(y), r2=68(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 203
LDI r2, 68
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
