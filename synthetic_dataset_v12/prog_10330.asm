; DESCRIPTION: Places a magenta 98x62 rectangle at position (339, 130).
; PLAN: r0=339(x), r1=130(y), r2=98(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 130
LDI r2, 98
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
