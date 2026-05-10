; DESCRIPTION: Creates a yellow rectangular region at (261, 27) spanning 92 by 102 pixels.
; PLAN: r0=261(x), r1=27(y), r2=92(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 27
LDI r2, 92
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
