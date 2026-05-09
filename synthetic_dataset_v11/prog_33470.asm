; DESCRIPTION: Creates a yellow rectangular region at (7, 178) spanning 105 by 71 pixels.
; PLAN: r0=7(x), r1=178(y), r2=105(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 178
LDI r2, 105
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
