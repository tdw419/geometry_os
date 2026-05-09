; DESCRIPTION: Places a black 98x108 rectangle at position (282, 128).
; PLAN: r0=282(x), r1=128(y), r2=98(width), r3=108(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 128
LDI r2, 98
LDI r3, 108
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
