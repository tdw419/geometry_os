; DESCRIPTION: Creates a white rectangular region at (315, 109) spanning 99 by 37 pixels.
; PLAN: r0=315(x), r1=109(y), r2=99(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 109
LDI r2, 99
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
