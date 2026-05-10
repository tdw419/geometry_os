; DESCRIPTION: Places a black 25x18 rectangle at position (124, 63).
; PLAN: r0=124(x), r1=63(y), r2=25(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 63
LDI r2, 25
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
