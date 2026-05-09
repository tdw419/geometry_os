; DESCRIPTION: Creates a cyan rectangular region at (26, 3) spanning 110 by 117 pixels.
; PLAN: r0=26(x), r1=3(y), r2=110(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 3
LDI r2, 110
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
