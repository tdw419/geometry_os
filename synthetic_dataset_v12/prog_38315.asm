; DESCRIPTION: Creates a white rectangular region at (155, 10) spanning 13 by 109 pixels.
; PLAN: r0=155(x), r1=10(y), r2=13(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 10
LDI r2, 13
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
