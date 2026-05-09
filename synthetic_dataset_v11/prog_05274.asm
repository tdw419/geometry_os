; DESCRIPTION: Creates a white rectangular region at (33, 99) spanning 85 by 111 pixels.
; PLAN: r0=33(x), r1=99(y), r2=85(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 99
LDI r2, 85
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
