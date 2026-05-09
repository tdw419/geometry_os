; DESCRIPTION: Places a orange 53x92 rectangle at position (399, 63).
; PLAN: r0=399(x), r1=63(y), r2=53(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 63
LDI r2, 53
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
