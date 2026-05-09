; DESCRIPTION: Places a black 28x102 rectangle at position (63, 53).
; PLAN: r0=63(x), r1=53(y), r2=28(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 53
LDI r2, 28
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
