; DESCRIPTION: Creates a white rectangular region at (253, 27) spanning 57 by 58 pixels.
; PLAN: r0=253(x), r1=27(y), r2=57(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 27
LDI r2, 57
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
