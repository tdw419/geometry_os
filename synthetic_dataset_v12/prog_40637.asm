; DESCRIPTION: Creates a black rectangular region at (166, 57) spanning 37 by 30 pixels.
; PLAN: r0=166(x), r1=57(y), r2=37(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 57
LDI r2, 37
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
