; DESCRIPTION: Creates a purple rectangular region at (320, 7) spanning 91 by 15 pixels.
; PLAN: r0=320(x), r1=7(y), r2=91(width), r3=15(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 7
LDI r2, 91
LDI r3, 15
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
