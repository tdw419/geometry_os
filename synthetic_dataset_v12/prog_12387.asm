; DESCRIPTION: Creates a white rectangular region at (338, 87) spanning 27 by 115 pixels.
; PLAN: r0=338(x), r1=87(y), r2=27(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 87
LDI r2, 27
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
