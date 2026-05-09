; DESCRIPTION: Places a purple 75x37 rectangle at position (205, 24).
; PLAN: r0=205(x), r1=24(y), r2=75(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 24
LDI r2, 75
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
