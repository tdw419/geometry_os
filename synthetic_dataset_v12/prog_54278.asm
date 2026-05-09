; DESCRIPTION: Places a blue 20x112 rectangle at position (66, 129).
; PLAN: r0=66(x), r1=129(y), r2=20(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 129
LDI r2, 20
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
