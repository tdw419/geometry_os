; DESCRIPTION: Creates a white rectangular region at (191, 172) spanning 39 by 24 pixels.
; PLAN: r0=191(x), r1=172(y), r2=39(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 172
LDI r2, 39
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
