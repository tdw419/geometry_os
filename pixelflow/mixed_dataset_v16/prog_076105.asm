; DESCRIPTION: Places a black 113x16 rectangle at position (128, 156).
; PLAN: r0=128(x), r1=156(y), r2=113(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 156
LDI r2, 113
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
