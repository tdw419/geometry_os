; DESCRIPTION: Creates a cyan rectangular region at (447, 122) spanning 38 by 33 pixels.
; PLAN: r0=447(x), r1=122(y), r2=38(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 122
LDI r2, 38
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
