; DESCRIPTION: Creates a cyan rectangular region at (150, 45) spanning 108 by 35 pixels.
; PLAN: r0=150(x), r1=45(y), r2=108(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 45
LDI r2, 108
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
