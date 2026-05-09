; DESCRIPTION: Places a blue 22x15 rectangle at position (24, 237).
; PLAN: r0=24(x), r1=237(y), r2=22(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 237
LDI r2, 22
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
