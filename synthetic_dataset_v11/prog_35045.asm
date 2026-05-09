; DESCRIPTION: Places a cyan 30x118 rectangle at position (116, 32).
; PLAN: r0=116(x), r1=32(y), r2=30(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 32
LDI r2, 30
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
