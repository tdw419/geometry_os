; DESCRIPTION: Creates a purple rectangular region at (61, 40) spanning 45 by 59 pixels.
; PLAN: r0=61(x), r1=40(y), r2=45(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 40
LDI r2, 45
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
