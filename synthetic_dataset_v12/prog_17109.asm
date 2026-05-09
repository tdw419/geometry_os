; DESCRIPTION: Places a orange 19x92 rectangle at position (0, 101).
; PLAN: r0=0(x), r1=101(y), r2=19(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 101
LDI r2, 19
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
