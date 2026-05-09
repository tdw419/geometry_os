; DESCRIPTION: Creates a purple rectangular region at (394, 151) spanning 97 by 94 pixels.
; PLAN: r0=394(x), r1=151(y), r2=97(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 151
LDI r2, 97
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
