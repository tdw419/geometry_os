; DESCRIPTION: Creates a purple rectangular region at (213, 18) spanning 90 by 87 pixels.
; PLAN: r0=213(x), r1=18(y), r2=90(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 18
LDI r2, 90
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
