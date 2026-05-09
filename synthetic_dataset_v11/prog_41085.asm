; DESCRIPTION: Places a cyan 64x53 rectangle at position (44, 81).
; PLAN: r0=44(x), r1=81(y), r2=64(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 81
LDI r2, 64
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
