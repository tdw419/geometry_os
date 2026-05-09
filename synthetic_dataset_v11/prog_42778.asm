; DESCRIPTION: Creates a cyan rectangular region at (92, 78) spanning 88 by 46 pixels.
; PLAN: r0=92(x), r1=78(y), r2=88(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 78
LDI r2, 88
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
