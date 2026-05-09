; DESCRIPTION: Creates a purple rectangular region at (226, 27) spanning 94 by 76 pixels.
; PLAN: r0=226(x), r1=27(y), r2=94(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 27
LDI r2, 94
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
