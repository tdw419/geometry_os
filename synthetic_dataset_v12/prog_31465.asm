; DESCRIPTION: Places a orange 18x67 rectangle at position (151, 125).
; PLAN: r0=151(x), r1=125(y), r2=18(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 125
LDI r2, 18
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
