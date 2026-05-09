; DESCRIPTION: Creates a white rectangular region at (407, 152) spanning 73 by 16 pixels.
; PLAN: r0=407(x), r1=152(y), r2=73(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 152
LDI r2, 73
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
