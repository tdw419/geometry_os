; DESCRIPTION: Places a blue 17x102 rectangle at position (190, 23).
; PLAN: r0=190(x), r1=23(y), r2=17(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 23
LDI r2, 17
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
