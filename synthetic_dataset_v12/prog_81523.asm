; DESCRIPTION: Creates a cyan rectangular region at (270, 20) spanning 73 by 44 pixels.
; PLAN: r0=270(x), r1=20(y), r2=73(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 20
LDI r2, 73
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
