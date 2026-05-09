; DESCRIPTION: Places a black 83x64 rectangle at position (128, 72).
; PLAN: r0=128(x), r1=72(y), r2=83(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 72
LDI r2, 83
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
