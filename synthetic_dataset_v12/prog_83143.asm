; DESCRIPTION: Creates a cyan rectangular region at (153, 69) spanning 16 by 84 pixels.
; PLAN: r0=153(x), r1=69(y), r2=16(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 69
LDI r2, 16
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
