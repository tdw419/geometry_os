; DESCRIPTION: Places a cyan 117x92 rectangle at position (381, 128).
; PLAN: r0=381(x), r1=128(y), r2=117(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 128
LDI r2, 117
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
