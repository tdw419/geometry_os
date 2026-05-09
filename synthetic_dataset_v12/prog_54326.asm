; DESCRIPTION: Creates a white rectangular region at (234, 146) spanning 108 by 101 pixels.
; PLAN: r0=234(x), r1=146(y), r2=108(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 146
LDI r2, 108
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
