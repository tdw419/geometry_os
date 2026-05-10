; DESCRIPTION: Places a purple 101x107 rectangle at position (209, 17).
; PLAN: r0=209(x), r1=17(y), r2=101(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 17
LDI r2, 101
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
