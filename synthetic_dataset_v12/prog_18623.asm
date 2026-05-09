; DESCRIPTION: Creates a blue rectangular region at (196, 97) spanning 83 by 93 pixels.
; PLAN: r0=196(x), r1=97(y), r2=83(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 97
LDI r2, 83
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
