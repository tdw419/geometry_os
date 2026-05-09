; DESCRIPTION: Creates a purple rectangular region at (20, 176) spanning 85 by 59 pixels.
; PLAN: r0=20(x), r1=176(y), r2=85(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 176
LDI r2, 85
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
