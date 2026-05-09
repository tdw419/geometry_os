; DESCRIPTION: Creates a white rectangular region at (54, 23) spanning 80 by 71 pixels.
; PLAN: r0=54(x), r1=23(y), r2=80(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 23
LDI r2, 80
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
