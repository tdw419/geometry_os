; DESCRIPTION: Places a blue 112x107 rectangle at position (19, 7).
; PLAN: r0=19(x), r1=7(y), r2=112(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 7
LDI r2, 112
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
