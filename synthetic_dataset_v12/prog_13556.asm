; DESCRIPTION: Places a blue 49x28 rectangle at position (45, 15).
; PLAN: r0=45(x), r1=15(y), r2=49(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 15
LDI r2, 49
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
