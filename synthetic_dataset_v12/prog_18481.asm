; DESCRIPTION: Creates a white rectangular region at (89, 103) spanning 33 by 98 pixels.
; PLAN: r0=89(x), r1=103(y), r2=33(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 103
LDI r2, 33
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
