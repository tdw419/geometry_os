; DESCRIPTION: Creates a purple rectangular region at (144, 234) spanning 65 by 19 pixels.
; PLAN: r0=144(x), r1=234(y), r2=65(width), r3=19(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 234
LDI r2, 65
LDI r3, 19
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
