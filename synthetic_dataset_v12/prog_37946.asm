; DESCRIPTION: Creates a white rectangular region at (108, 155) spanning 10 by 93 pixels.
; PLAN: r0=108(x), r1=155(y), r2=10(width), r3=93(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 155
LDI r2, 10
LDI r3, 93
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
