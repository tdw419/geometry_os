; DESCRIPTION: Places a blue 11x56 rectangle at position (12, 144).
; PLAN: r0=12(x), r1=144(y), r2=11(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 144
LDI r2, 11
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
