; DESCRIPTION: Creates a black rectangular region at (178, 57) spanning 68 by 57 pixels.
; PLAN: r0=178(x), r1=57(y), r2=68(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 57
LDI r2, 68
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
