; DESCRIPTION: Creates a white rectangular region at (290, 219) spanning 46 by 33 pixels.
; PLAN: r0=290(x), r1=219(y), r2=46(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 219
LDI r2, 46
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
