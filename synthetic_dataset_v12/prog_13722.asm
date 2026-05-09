; DESCRIPTION: Places a black 30x111 rectangle at position (211, 63).
; PLAN: r0=211(x), r1=63(y), r2=30(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 63
LDI r2, 30
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
