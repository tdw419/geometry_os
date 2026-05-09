; DESCRIPTION: Creates a cyan rectangular region at (57, 49) spanning 117 by 98 pixels.
; PLAN: r0=57(x), r1=49(y), r2=117(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 49
LDI r2, 117
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
