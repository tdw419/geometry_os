; DESCRIPTION: Creates a purple rectangular region at (98, 27) spanning 21 by 35 pixels.
; PLAN: r0=98(x), r1=27(y), r2=21(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 27
LDI r2, 21
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
