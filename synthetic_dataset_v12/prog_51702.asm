; DESCRIPTION: Creates a purple rectangular region at (46, 39) spanning 13 by 88 pixels.
; PLAN: r0=46(x), r1=39(y), r2=13(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 39
LDI r2, 13
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
