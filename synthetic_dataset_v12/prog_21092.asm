; DESCRIPTION: Creates a white rectangular region at (402, 152) spanning 83 by 57 pixels.
; PLAN: r0=402(x), r1=152(y), r2=83(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 152
LDI r2, 83
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
