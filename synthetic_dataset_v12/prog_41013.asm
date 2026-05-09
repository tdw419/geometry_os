; DESCRIPTION: Creates a white rectangular region at (109, 3) spanning 90 by 47 pixels.
; PLAN: r0=109(x), r1=3(y), r2=90(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 3
LDI r2, 90
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
