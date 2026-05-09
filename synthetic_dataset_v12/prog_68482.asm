; DESCRIPTION: Places a orange 74x50 rectangle at position (203, 125).
; PLAN: r0=203(x), r1=125(y), r2=74(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 125
LDI r2, 74
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
