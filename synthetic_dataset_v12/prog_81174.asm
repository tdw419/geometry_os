; DESCRIPTION: Places a blue 32x105 rectangle at position (453, 49).
; PLAN: r0=453(x), r1=49(y), r2=32(width), r3=105(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 49
LDI r2, 32
LDI r3, 105
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
