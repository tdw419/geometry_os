; DESCRIPTION: Creates a cyan rectangular region at (355, 20) spanning 77 by 88 pixels.
; PLAN: r0=355(x), r1=20(y), r2=77(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 20
LDI r2, 77
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
