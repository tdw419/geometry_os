; DESCRIPTION: Places a blue 40x102 rectangle at position (258, 36).
; PLAN: r0=258(x), r1=36(y), r2=40(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 36
LDI r2, 40
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
