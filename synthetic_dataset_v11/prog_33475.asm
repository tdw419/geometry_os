; DESCRIPTION: Places a orange 27x69 rectangle at position (74, 61).
; PLAN: r0=74(x), r1=61(y), r2=27(width), r3=69(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 61
LDI r2, 27
LDI r3, 69
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
