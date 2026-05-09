; DESCRIPTION: Creates a white rectangular region at (285, 91) spanning 99 by 82 pixels.
; PLAN: r0=285(x), r1=91(y), r2=99(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 91
LDI r2, 99
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
