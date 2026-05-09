; DESCRIPTION: Creates a white rectangular region at (244, 149) spanning 47 by 59 pixels.
; PLAN: r0=244(x), r1=149(y), r2=47(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 149
LDI r2, 47
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
