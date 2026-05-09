; DESCRIPTION: Creates a yellow rectangular region at (84, 93) spanning 30 by 28 pixels.
; PLAN: r0=84(x), r1=93(y), r2=30(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 93
LDI r2, 30
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
