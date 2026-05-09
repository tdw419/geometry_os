; DESCRIPTION: Places a blue 52x29 rectangle at position (451, 190).
; PLAN: r0=451(x), r1=190(y), r2=52(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 190
LDI r2, 52
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
