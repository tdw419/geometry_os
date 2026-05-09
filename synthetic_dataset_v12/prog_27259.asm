; DESCRIPTION: Creates a purple rectangular region at (372, 132) spanning 98 by 94 pixels.
; PLAN: r0=372(x), r1=132(y), r2=98(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 132
LDI r2, 98
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
