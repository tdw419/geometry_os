; DESCRIPTION: Places a black 43x83 rectangle at position (32, 27).
; PLAN: r0=32(x), r1=27(y), r2=43(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 27
LDI r2, 43
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
