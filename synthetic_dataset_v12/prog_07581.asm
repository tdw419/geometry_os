; DESCRIPTION: Places a blue 67x82 rectangle at position (147, 157).
; PLAN: r0=147(x), r1=157(y), r2=67(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 157
LDI r2, 67
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
