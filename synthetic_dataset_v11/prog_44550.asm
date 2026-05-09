; DESCRIPTION: Places a blue 107x98 rectangle at position (142, 74).
; PLAN: r0=142(x), r1=74(y), r2=107(width), r3=98(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 74
LDI r2, 107
LDI r3, 98
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
