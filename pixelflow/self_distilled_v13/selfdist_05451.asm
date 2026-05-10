; DESCRIPTION: Places a orange 39x61 box at position (53, 123).
; PLAN: r0=53(x), r1=123(y), r2=39(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 123
LDI r2, 39
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
