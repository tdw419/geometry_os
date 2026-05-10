; DESCRIPTION: Creates a white rectangular region at (84, 81) spanning 89 by 54 pixels.
; PLAN: r0=84(x), r1=81(y), r2=89(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 81
LDI r2, 89
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
