; DESCRIPTION: Creates a purple rectangular region at (5, 173) spanning 25 by 59 pixels.
; PLAN: r0=5(x), r1=173(y), r2=25(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 173
LDI r2, 25
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
