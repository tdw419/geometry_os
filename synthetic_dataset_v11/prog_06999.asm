; DESCRIPTION: Creates a white rectangular region at (172, 178) spanning 54 by 56 pixels.
; PLAN: r0=172(x), r1=178(y), r2=54(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 178
LDI r2, 54
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
