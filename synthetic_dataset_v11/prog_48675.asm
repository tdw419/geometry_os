; DESCRIPTION: Places a black 53x36 rectangle at position (61, 192).
; PLAN: r0=61(x), r1=192(y), r2=53(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 192
LDI r2, 53
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
