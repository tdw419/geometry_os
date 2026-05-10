; DESCRIPTION: Places a orange 82x53 rectangle at position (3, 101).
; PLAN: r0=3(x), r1=101(y), r2=82(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 101
LDI r2, 82
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
