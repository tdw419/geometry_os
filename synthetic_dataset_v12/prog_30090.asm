; DESCRIPTION: Places a cyan 116x14 rectangle at position (8, 6).
; PLAN: r0=8(x), r1=6(y), r2=116(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 6
LDI r2, 116
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
