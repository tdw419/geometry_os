; DESCRIPTION: Creates a purple rectangular region at (78, 205) spanning 86 by 20 pixels.
; PLAN: r0=78(x), r1=205(y), r2=86(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 205
LDI r2, 86
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
