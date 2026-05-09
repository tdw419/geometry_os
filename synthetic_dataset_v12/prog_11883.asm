; DESCRIPTION: Creates a white rectangular region at (7, 120) spanning 21 by 22 pixels.
; PLAN: r0=7(x), r1=120(y), r2=21(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 120
LDI r2, 21
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
