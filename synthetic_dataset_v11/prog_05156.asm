; DESCRIPTION: Creates a yellow rectangular region at (29, 143) spanning 71 by 86 pixels.
; PLAN: r0=29(x), r1=143(y), r2=71(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 143
LDI r2, 71
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
