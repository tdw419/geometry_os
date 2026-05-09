; DESCRIPTION: Creates a purple rectangular region at (98, 151) spanning 75 by 17 pixels.
; PLAN: r0=98(x), r1=151(y), r2=75(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 151
LDI r2, 75
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
