; DESCRIPTION: Creates a blue rectangular region at (156, 167) spanning 17 by 71 pixels.
; PLAN: r0=156(x), r1=167(y), r2=17(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 167
LDI r2, 17
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
