; DESCRIPTION: Places a cyan 53x44 rectangle at position (96, 133).
; PLAN: r0=96(x), r1=133(y), r2=53(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 133
LDI r2, 53
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
