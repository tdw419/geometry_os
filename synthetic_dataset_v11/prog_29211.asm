; DESCRIPTION: Creates a purple rectangular region at (59, 146) spanning 109 by 13 pixels.
; PLAN: r0=59(x), r1=146(y), r2=109(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 146
LDI r2, 109
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
