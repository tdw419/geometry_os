; DESCRIPTION: Places a cyan 101x60 rectangle at position (53, 11).
; PLAN: r0=53(x), r1=11(y), r2=101(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 11
LDI r2, 101
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
