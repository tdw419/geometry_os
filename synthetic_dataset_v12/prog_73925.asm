; DESCRIPTION: Places a purple 74x17 rectangle at position (353, 239).
; PLAN: r0=353(x), r1=239(y), r2=74(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 239
LDI r2, 74
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
