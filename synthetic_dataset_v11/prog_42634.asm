; DESCRIPTION: Creates a white rectangular region at (22, 100) spanning 113 by 94 pixels.
; PLAN: r0=22(x), r1=100(y), r2=113(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 100
LDI r2, 113
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
