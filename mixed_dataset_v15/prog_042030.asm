; DESCRIPTION: Places a black 76x81 rectangle at position (373, 156).
; PLAN: r0=373(x), r1=156(y), r2=76(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 156
LDI r2, 76
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
