; DESCRIPTION: Places a blue 118x71 rectangle at position (203, 96).
; PLAN: r0=203(x), r1=96(y), r2=118(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 96
LDI r2, 118
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
