; DESCRIPTION: Creates a white rectangular region at (125, 32) spanning 77 by 80 pixels.
; PLAN: r0=125(x), r1=32(y), r2=77(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 32
LDI r2, 77
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
