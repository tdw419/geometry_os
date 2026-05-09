; DESCRIPTION: Places a cyan 62x119 rectangle at position (131, 103).
; PLAN: r0=131(x), r1=103(y), r2=62(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 103
LDI r2, 62
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
