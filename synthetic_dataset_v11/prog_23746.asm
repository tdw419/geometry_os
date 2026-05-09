; DESCRIPTION: Creates a white rectangular region at (28, 1) spanning 113 by 68 pixels.
; PLAN: r0=28(x), r1=1(y), r2=113(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 1
LDI r2, 113
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
