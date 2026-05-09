; DESCRIPTION: Places a black 73x65 rectangle at position (183, 32).
; PLAN: r0=183(x), r1=32(y), r2=73(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 32
LDI r2, 73
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
