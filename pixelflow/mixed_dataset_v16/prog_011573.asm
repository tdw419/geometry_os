; DESCRIPTION: Creates a cyan rectangular region at (200, 69) spanning 105 by 35 pixels.
; PLAN: r0=200(x), r1=69(y), r2=105(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 69
LDI r2, 105
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
