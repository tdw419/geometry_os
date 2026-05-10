; DESCRIPTION: Places a black 105x60 rectangle at position (33, 32).
; PLAN: r0=33(x), r1=32(y), r2=105(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 32
LDI r2, 105
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
