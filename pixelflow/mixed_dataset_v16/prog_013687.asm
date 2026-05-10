; DESCRIPTION: Creates a purple rectangular region at (112, 164) spanning 71 by 68 pixels.
; PLAN: r0=112(x), r1=164(y), r2=71(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 164
LDI r2, 71
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
