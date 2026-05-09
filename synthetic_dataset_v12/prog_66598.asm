; DESCRIPTION: Creates a blue rectangular region at (94, 96) spanning 90 by 93 pixels.
; PLAN: r0=94(x), r1=96(y), r2=90(width), r3=93(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 96
LDI r2, 90
LDI r3, 93
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
