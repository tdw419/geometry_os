; DESCRIPTION: Places a blue 101x15 rectangle at position (52, 96).
; PLAN: r0=52(x), r1=96(y), r2=101(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 96
LDI r2, 101
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
