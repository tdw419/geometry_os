; DESCRIPTION: Places a blue 23x82 rectangle at position (147, 126).
; PLAN: r0=147(x), r1=126(y), r2=23(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 126
LDI r2, 23
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
