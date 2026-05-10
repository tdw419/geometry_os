; DESCRIPTION: Places a blue 25x56 rectangle at position (81, 15).
; PLAN: r0=81(x), r1=15(y), r2=25(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 15
LDI r2, 25
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
