; DESCRIPTION: Places a cyan 76x16 rectangle at position (376, 199).
; PLAN: r0=376(x), r1=199(y), r2=76(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 199
LDI r2, 76
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
