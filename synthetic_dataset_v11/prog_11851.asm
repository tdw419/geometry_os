; DESCRIPTION: Creates a purple rectangular region at (90, 59) spanning 92 by 77 pixels.
; PLAN: r0=90(x), r1=59(y), r2=92(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 59
LDI r2, 92
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
