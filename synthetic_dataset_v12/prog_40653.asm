; DESCRIPTION: Creates a purple rectangular region at (307, 2) spanning 107 by 97 pixels.
; PLAN: r0=307(x), r1=2(y), r2=107(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 2
LDI r2, 107
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
