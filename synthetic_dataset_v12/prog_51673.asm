; DESCRIPTION: Places a purple 55x29 rectangle at position (442, 37).
; PLAN: r0=442(x), r1=37(y), r2=55(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 37
LDI r2, 55
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
