; DESCRIPTION: Places a orange 76x61 rectangle at position (338, 125).
; PLAN: r0=338(x), r1=125(y), r2=76(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 125
LDI r2, 76
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
