; DESCRIPTION: Creates a green rectangular region at (159, 124) spanning 77 by 96 pixels.
; PLAN: r0=159(x), r1=124(y), r2=77(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 124
LDI r2, 77
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
