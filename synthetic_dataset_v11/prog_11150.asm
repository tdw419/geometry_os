; DESCRIPTION: Places a purple 81x105 rectangle at position (25, 12).
; PLAN: r0=25(x), r1=12(y), r2=81(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 12
LDI r2, 81
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
