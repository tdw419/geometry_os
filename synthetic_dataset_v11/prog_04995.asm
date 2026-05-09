; DESCRIPTION: Places a black 73x12 rectangle at position (157, 48).
; PLAN: r0=157(x), r1=48(y), r2=73(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 48
LDI r2, 73
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
