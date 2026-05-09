; DESCRIPTION: Creates a purple rectangular region at (406, 15) spanning 28 by 50 pixels.
; PLAN: r0=406(x), r1=15(y), r2=28(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 15
LDI r2, 28
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
