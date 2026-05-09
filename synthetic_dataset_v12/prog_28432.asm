; DESCRIPTION: Creates a blue rectangular region at (279, 39) spanning 97 by 39 pixels.
; PLAN: r0=279(x), r1=39(y), r2=97(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 39
LDI r2, 97
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
