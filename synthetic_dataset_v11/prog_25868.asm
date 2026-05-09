; DESCRIPTION: Places a orange 53x66 rectangle at position (33, 6).
; PLAN: r0=33(x), r1=6(y), r2=53(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 6
LDI r2, 53
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
