; DESCRIPTION: Creates a white rectangular region at (152, 115) spanning 68 by 87 pixels.
; PLAN: r0=152(x), r1=115(y), r2=68(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 115
LDI r2, 68
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
