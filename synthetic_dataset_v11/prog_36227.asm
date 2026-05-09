; DESCRIPTION: Creates a white rectangular region at (124, 23) spanning 113 by 86 pixels.
; PLAN: r0=124(x), r1=23(y), r2=113(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 23
LDI r2, 113
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
