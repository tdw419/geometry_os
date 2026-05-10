; DESCRIPTION: Creates a blue rectangular region at (167, 21) spanning 101 by 71 pixels.
; PLAN: r0=167(x), r1=21(y), r2=101(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 21
LDI r2, 101
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
