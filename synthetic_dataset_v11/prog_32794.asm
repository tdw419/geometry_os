; DESCRIPTION: Places a purple 37x82 rectangle at position (130, 17).
; PLAN: r0=130(x), r1=17(y), r2=37(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 17
LDI r2, 37
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
