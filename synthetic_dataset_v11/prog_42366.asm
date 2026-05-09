; DESCRIPTION: Places a orange 53x95 rectangle at position (142, 128).
; PLAN: r0=142(x), r1=128(y), r2=53(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 128
LDI r2, 53
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
