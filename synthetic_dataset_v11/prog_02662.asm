; DESCRIPTION: Creates a purple rectangular region at (209, 86) spanning 36 by 115 pixels.
; PLAN: r0=209(x), r1=86(y), r2=36(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 86
LDI r2, 36
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
