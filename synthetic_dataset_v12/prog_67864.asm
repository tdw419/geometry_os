; DESCRIPTION: Creates a white rectangular region at (107, 152) spanning 115 by 44 pixels.
; PLAN: r0=107(x), r1=152(y), r2=115(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 152
LDI r2, 115
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
