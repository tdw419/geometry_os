; DESCRIPTION: Places a black 86x82 rectangle at position (1, 134).
; PLAN: r0=1(x), r1=134(y), r2=86(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 134
LDI r2, 86
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
