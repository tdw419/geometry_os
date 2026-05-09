; DESCRIPTION: Creates a purple rectangular region at (7, 74) spanning 76 by 59 pixels.
; PLAN: r0=7(x), r1=74(y), r2=76(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 74
LDI r2, 76
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
