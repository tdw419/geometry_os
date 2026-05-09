; DESCRIPTION: Places a orange 74x115 rectangle at position (329, 3).
; PLAN: r0=329(x), r1=3(y), r2=74(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 3
LDI r2, 74
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
