; DESCRIPTION: Places a black 22x116 rectangle at position (156, 49).
; PLAN: r0=156(x), r1=49(y), r2=22(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 49
LDI r2, 22
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
