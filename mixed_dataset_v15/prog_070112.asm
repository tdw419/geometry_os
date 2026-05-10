; DESCRIPTION: Places a black 109x39 rectangle at position (64, 137).
; PLAN: r0=64(x), r1=137(y), r2=109(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 137
LDI r2, 109
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
