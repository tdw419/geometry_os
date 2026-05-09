; DESCRIPTION: Places a purple 115x14 rectangle at position (25, 125).
; PLAN: r0=25(x), r1=125(y), r2=115(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 125
LDI r2, 115
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
