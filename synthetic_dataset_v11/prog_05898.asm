; DESCRIPTION: Places a purple 15x96 rectangle at position (239, 55).
; PLAN: r0=239(x), r1=55(y), r2=15(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 55
LDI r2, 15
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
