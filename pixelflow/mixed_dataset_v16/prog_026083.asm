; DESCRIPTION: Places a yellow 53x19 rectangle at position (356, 176).
; PLAN: r0=356(x), r1=176(y), r2=53(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 176
LDI r2, 53
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
