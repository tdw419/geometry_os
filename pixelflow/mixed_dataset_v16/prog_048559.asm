; DESCRIPTION: Places a purple 12x47 rectangle at position (175, 122).
; PLAN: r0=175(x), r1=122(y), r2=12(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 122
LDI r2, 12
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
