; DESCRIPTION: Places a black 57x46 rectangle at position (64, 204).
; PLAN: r0=64(x), r1=204(y), r2=57(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 204
LDI r2, 57
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
