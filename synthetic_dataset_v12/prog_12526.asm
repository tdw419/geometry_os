; DESCRIPTION: Places a purple 93x33 rectangle at position (375, 12).
; PLAN: r0=375(x), r1=12(y), r2=93(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 12
LDI r2, 93
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
