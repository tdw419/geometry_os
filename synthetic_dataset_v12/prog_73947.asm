; DESCRIPTION: Creates a white rectangular region at (414, 165) spanning 59 by 70 pixels.
; PLAN: r0=414(x), r1=165(y), r2=59(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 165
LDI r2, 59
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
