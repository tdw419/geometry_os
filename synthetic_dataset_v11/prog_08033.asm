; DESCRIPTION: Creates a cyan rectangular region at (97, 59) spanning 20 by 33 pixels.
; PLAN: r0=97(x), r1=59(y), r2=20(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 59
LDI r2, 20
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
