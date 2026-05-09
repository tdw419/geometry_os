; DESCRIPTION: Places a purple 26x12 rectangle at position (214, 57).
; PLAN: r0=214(x), r1=57(y), r2=26(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 57
LDI r2, 26
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
