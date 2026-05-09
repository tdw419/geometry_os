; DESCRIPTION: Places a orange 95x61 rectangle at position (67, 125).
; PLAN: r0=67(x), r1=125(y), r2=95(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 125
LDI r2, 95
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
