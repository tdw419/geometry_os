; DESCRIPTION: Creates a white rectangular region at (473, 162) spanning 38 by 27 pixels.
; PLAN: r0=473(x), r1=162(y), r2=38(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 162
LDI r2, 38
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
