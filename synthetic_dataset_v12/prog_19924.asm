; DESCRIPTION: Creates a cyan rectangular region at (398, 135) spanning 23 by 20 pixels.
; PLAN: r0=398(x), r1=135(y), r2=23(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 135
LDI r2, 23
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
