; DESCRIPTION: Creates a white rectangular region at (275, 119) spanning 71 by 80 pixels.
; PLAN: r0=275(x), r1=119(y), r2=71(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 119
LDI r2, 71
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
