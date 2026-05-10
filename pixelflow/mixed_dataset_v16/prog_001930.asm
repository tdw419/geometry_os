; DESCRIPTION: Creates a white rectangular region at (346, 155) spanning 27 by 75 pixels.
; PLAN: r0=346(x), r1=155(y), r2=27(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 155
LDI r2, 27
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
