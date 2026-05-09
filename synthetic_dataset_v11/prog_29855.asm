; DESCRIPTION: Creates a blue rectangular region at (36, 132) spanning 117 by 93 pixels.
; PLAN: r0=36(x), r1=132(y), r2=117(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 132
LDI r2, 117
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
