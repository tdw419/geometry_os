; DESCRIPTION: Creates a purple rectangular region at (214, 71) spanning 40 by 59 pixels.
; PLAN: r0=214(x), r1=71(y), r2=40(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 71
LDI r2, 40
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
