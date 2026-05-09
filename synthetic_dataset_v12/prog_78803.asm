; DESCRIPTION: Creates a white rectangular region at (400, 37) spanning 99 by 111 pixels.
; PLAN: r0=400(x), r1=37(y), r2=99(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 37
LDI r2, 99
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
