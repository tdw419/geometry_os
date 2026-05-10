; DESCRIPTION: Places a purple 43x74 rectangle at position (405, 29).
; PLAN: r0=405(x), r1=29(y), r2=43(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 29
LDI r2, 43
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
