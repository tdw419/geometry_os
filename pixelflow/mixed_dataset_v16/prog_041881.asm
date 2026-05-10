; DESCRIPTION: Creates a white rectangular region at (128, 65) spanning 115 by 12 pixels.
; PLAN: r0=128(x), r1=65(y), r2=115(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 65
LDI r2, 115
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
