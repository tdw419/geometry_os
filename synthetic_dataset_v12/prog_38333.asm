; DESCRIPTION: Places a orange 74x23 rectangle at position (36, 73).
; PLAN: r0=36(x), r1=73(y), r2=74(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 73
LDI r2, 74
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
