; DESCRIPTION: Places a blue 12x112 rectangle at position (144, 18).
; PLAN: r0=144(x), r1=18(y), r2=12(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 18
LDI r2, 12
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
