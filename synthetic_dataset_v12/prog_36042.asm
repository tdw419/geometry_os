; DESCRIPTION: Creates a white rectangular region at (178, 8) spanning 58 by 85 pixels.
; PLAN: r0=178(x), r1=8(y), r2=58(width), r3=85(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 8
LDI r2, 58
LDI r3, 85
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
