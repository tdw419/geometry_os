; DESCRIPTION: Creates a purple rectangular region at (30, 98) spanning 17 by 59 pixels.
; PLAN: r0=30(x), r1=98(y), r2=17(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 98
LDI r2, 17
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
