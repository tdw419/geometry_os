; DESCRIPTION: Creates a cyan rectangular region at (78, 20) spanning 33 by 59 pixels.
; PLAN: r0=78(x), r1=20(y), r2=33(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 20
LDI r2, 33
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
