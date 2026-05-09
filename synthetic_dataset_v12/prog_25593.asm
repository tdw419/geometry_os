; DESCRIPTION: Places a blue 46x37 rectangle at position (128, 126).
; PLAN: r0=128(x), r1=126(y), r2=46(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 126
LDI r2, 46
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
