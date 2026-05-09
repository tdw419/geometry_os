; DESCRIPTION: Places a black 32x13 rectangle at position (196, 240).
; PLAN: r0=196(x), r1=240(y), r2=32(width), r3=13(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 240
LDI r2, 32
LDI r3, 13
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
