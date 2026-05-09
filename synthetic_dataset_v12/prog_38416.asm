; DESCRIPTION: Places a blue 32x112 rectangle at position (268, 23).
; PLAN: r0=268(x), r1=23(y), r2=32(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 23
LDI r2, 32
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
