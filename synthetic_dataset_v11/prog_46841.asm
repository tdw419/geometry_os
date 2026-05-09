; DESCRIPTION: Places a blue 14x102 rectangle at position (191, 130).
; PLAN: r0=191(x), r1=130(y), r2=14(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 130
LDI r2, 14
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
