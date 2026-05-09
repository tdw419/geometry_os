; DESCRIPTION: Creates a white rectangular region at (46, 21) spanning 118 by 108 pixels.
; PLAN: r0=46(x), r1=21(y), r2=118(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 21
LDI r2, 118
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
