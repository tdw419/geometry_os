; DESCRIPTION: Places a cyan 96x69 rectangle at position (397, 45).
; PLAN: r0=397(x), r1=45(y), r2=96(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 45
LDI r2, 96
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
