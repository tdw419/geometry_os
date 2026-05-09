; DESCRIPTION: Places a black 39x64 rectangle at position (64, 39).
; PLAN: r0=64(x), r1=39(y), r2=39(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 39
LDI r2, 39
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
