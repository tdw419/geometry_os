; DESCRIPTION: Places a blue 66x92 rectangle at position (435, 52).
; PLAN: r0=435(x), r1=52(y), r2=66(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 52
LDI r2, 66
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
