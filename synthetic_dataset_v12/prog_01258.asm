; DESCRIPTION: Creates a purple rectangular region at (220, 12) spanning 114 by 98 pixels.
; PLAN: r0=220(x), r1=12(y), r2=114(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 12
LDI r2, 114
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
