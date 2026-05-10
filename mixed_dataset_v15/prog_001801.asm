; DESCRIPTION: Places a orange 43x67 rectangle at position (9, 51).
; PLAN: r0=9(x), r1=51(y), r2=43(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 51
LDI r2, 43
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
