; DESCRIPTION: Creates a cyan rectangular region at (162, 125) spanning 47 by 94 pixels.
; PLAN: r0=162(x), r1=125(y), r2=47(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 125
LDI r2, 47
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
