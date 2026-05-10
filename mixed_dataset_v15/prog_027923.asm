; DESCRIPTION: Creates a black rectangular region at (37, 178) spanning 78 by 27 pixels.
; PLAN: r0=37(x), r1=178(y), r2=78(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 178
LDI r2, 78
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
