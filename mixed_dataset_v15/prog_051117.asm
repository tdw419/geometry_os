; DESCRIPTION: Creates a white rectangular region at (161, 59) spanning 21 by 54 pixels.
; PLAN: r0=161(x), r1=59(y), r2=21(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 59
LDI r2, 21
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
