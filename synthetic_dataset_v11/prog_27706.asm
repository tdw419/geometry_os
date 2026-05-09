; DESCRIPTION: Creates a yellow rectangular region at (171, 86) spanning 49 by 92 pixels.
; PLAN: r0=171(x), r1=86(y), r2=49(width), r3=92(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 86
LDI r2, 49
LDI r3, 92
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
