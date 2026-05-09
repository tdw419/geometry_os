; DESCRIPTION: Creates a purple rectangular region at (11, 173) spanning 99 by 65 pixels.
; PLAN: r0=11(x), r1=173(y), r2=99(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 173
LDI r2, 99
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
