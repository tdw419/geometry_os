; DESCRIPTION: Creates a white rectangular region at (108, 21) spanning 118 by 59 pixels.
; PLAN: r0=108(x), r1=21(y), r2=118(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 21
LDI r2, 118
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
