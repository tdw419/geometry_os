; DESCRIPTION: Creates a purple rectangular region at (61, 132) spanning 98 by 114 pixels.
; PLAN: r0=61(x), r1=132(y), r2=98(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 132
LDI r2, 98
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
