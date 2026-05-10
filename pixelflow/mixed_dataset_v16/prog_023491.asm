; DESCRIPTION: Creates a cyan rectangular region at (412, 75) spanning 13 by 73 pixels.
; PLAN: r0=412(x), r1=75(y), r2=13(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 75
LDI r2, 13
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
