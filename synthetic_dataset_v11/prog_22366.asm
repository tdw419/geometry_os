; DESCRIPTION: Creates a cyan rectangular region at (84, 207) spanning 74 by 29 pixels.
; PLAN: r0=84(x), r1=207(y), r2=74(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 207
LDI r2, 74
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
