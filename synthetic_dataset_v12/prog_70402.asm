; DESCRIPTION: Creates a blue rectangular region at (399, 165) spanning 83 by 77 pixels.
; PLAN: r0=399(x), r1=165(y), r2=83(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 165
LDI r2, 83
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
