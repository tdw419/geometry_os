; DESCRIPTION: Creates a white rectangular region at (155, 4) spanning 25 by 27 pixels.
; PLAN: r0=155(x), r1=4(y), r2=25(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 4
LDI r2, 25
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
