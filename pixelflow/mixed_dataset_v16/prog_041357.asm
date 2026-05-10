; DESCRIPTION: Creates a purple rectangular region at (11, 59) spanning 79 by 91 pixels.
; PLAN: r0=11(x), r1=59(y), r2=79(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 59
LDI r2, 79
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
