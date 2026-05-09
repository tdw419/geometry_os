; DESCRIPTION: Places a blue 24x118 rectangle at position (269, 72).
; PLAN: r0=269(x), r1=72(y), r2=24(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 72
LDI r2, 24
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
