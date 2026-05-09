; DESCRIPTION: Creates a white rectangular region at (149, 70) spanning 96 by 86 pixels.
; PLAN: r0=149(x), r1=70(y), r2=96(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 70
LDI r2, 96
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
