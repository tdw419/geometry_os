; DESCRIPTION: Places a black 63x82 rectangle at position (164, 74).
; PLAN: r0=164(x), r1=74(y), r2=63(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 74
LDI r2, 63
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
