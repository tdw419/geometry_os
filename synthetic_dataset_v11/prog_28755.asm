; DESCRIPTION: Places a purple 114x82 rectangle at position (104, 130).
; PLAN: r0=104(x), r1=130(y), r2=114(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 130
LDI r2, 114
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
