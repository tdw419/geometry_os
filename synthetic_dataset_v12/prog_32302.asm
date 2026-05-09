; DESCRIPTION: Places a purple 54x105 rectangle at position (159, 20).
; PLAN: r0=159(x), r1=20(y), r2=54(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 20
LDI r2, 54
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
