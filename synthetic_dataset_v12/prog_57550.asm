; DESCRIPTION: Creates a cyan rectangular region at (176, 110) spanning 81 by 47 pixels.
; PLAN: r0=176(x), r1=110(y), r2=81(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 110
LDI r2, 81
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
