; DESCRIPTION: Places a blue 105x16 rectangle at position (40, 224).
; PLAN: r0=40(x), r1=224(y), r2=105(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 224
LDI r2, 105
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
