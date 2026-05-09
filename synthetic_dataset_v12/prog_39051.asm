; DESCRIPTION: Places a orange 117x72 rectangle at position (143, 101).
; PLAN: r0=143(x), r1=101(y), r2=117(width), r3=72(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 101
LDI r2, 117
LDI r3, 72
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
