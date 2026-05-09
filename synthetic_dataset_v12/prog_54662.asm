; DESCRIPTION: Creates a white rectangular region at (152, 45) spanning 51 by 99 pixels.
; PLAN: r0=152(x), r1=45(y), r2=51(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 45
LDI r2, 51
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
