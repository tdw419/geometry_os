; DESCRIPTION: Creates a white rectangular region at (106, 1) spanning 113 by 71 pixels.
; PLAN: r0=106(x), r1=1(y), r2=113(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 1
LDI r2, 113
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
