; DESCRIPTION: Places a blue 35x18 rectangle at position (45, 189).
; PLAN: r0=45(x), r1=189(y), r2=35(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 189
LDI r2, 35
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
