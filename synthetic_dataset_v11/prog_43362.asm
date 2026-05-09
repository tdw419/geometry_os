; DESCRIPTION: Creates a cyan rectangular region at (69, 83) spanning 65 by 16 pixels.
; PLAN: r0=69(x), r1=83(y), r2=65(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 83
LDI r2, 65
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
