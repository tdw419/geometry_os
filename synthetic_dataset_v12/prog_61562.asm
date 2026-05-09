; DESCRIPTION: Creates a white rectangular region at (152, 105) spanning 63 by 117 pixels.
; PLAN: r0=152(x), r1=105(y), r2=63(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 105
LDI r2, 63
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
