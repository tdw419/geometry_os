; DESCRIPTION: Creates a purple rectangular region at (174, 20) spanning 71 by 78 pixels.
; PLAN: r0=174(x), r1=20(y), r2=71(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 20
LDI r2, 71
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
