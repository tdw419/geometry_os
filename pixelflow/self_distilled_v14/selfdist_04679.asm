; DESCRIPTION: Places a cyan 117x64 box at position (376, 133).
; PLAN: r0=376(x), r1=133(y), r2=117(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 133
LDI r2, 117
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
