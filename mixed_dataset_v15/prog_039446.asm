; DESCRIPTION: Places a cyan 53x48 rectangle at position (16, 126).
; PLAN: r0=16(x), r1=126(y), r2=53(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 126
LDI r2, 53
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
