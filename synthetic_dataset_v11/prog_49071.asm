; DESCRIPTION: Creates a purple rectangular region at (209, 36) spanning 23 by 47 pixels.
; PLAN: r0=209(x), r1=36(y), r2=23(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 36
LDI r2, 23
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
