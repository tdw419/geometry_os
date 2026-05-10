; DESCRIPTION: Creates a white rectangular region at (295, 118) spanning 66 by 111 pixels.
; PLAN: r0=295(x), r1=118(y), r2=66(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 118
LDI r2, 66
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
