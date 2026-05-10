; DESCRIPTION: Places a purple 29x23 rectangle at position (414, 126).
; PLAN: r0=414(x), r1=126(y), r2=29(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 126
LDI r2, 29
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
