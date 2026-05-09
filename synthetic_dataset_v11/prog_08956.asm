; DESCRIPTION: Places a blue 99x115 rectangle at position (136, 25).
; PLAN: r0=136(x), r1=25(y), r2=99(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 25
LDI r2, 99
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
