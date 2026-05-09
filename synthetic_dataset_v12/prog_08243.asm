; DESCRIPTION: Creates a white rectangular region at (396, 199) spanning 65 by 12 pixels.
; PLAN: r0=396(x), r1=199(y), r2=65(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 199
LDI r2, 65
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
