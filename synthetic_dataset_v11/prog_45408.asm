; DESCRIPTION: Places a blue 91x18 rectangle at position (2, 32).
; PLAN: r0=2(x), r1=32(y), r2=91(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 32
LDI r2, 91
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
