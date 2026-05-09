; DESCRIPTION: Creates a cyan rectangular region at (359, 1) spanning 85 by 20 pixels.
; PLAN: r0=359(x), r1=1(y), r2=85(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 1
LDI r2, 85
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
