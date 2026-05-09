; DESCRIPTION: Places a purple 105x114 rectangle at position (21, 125).
; PLAN: r0=21(x), r1=125(y), r2=105(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 125
LDI r2, 105
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
