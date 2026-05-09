; DESCRIPTION: Creates a cyan rectangular region at (29, 8) spanning 75 by 115 pixels.
; PLAN: r0=29(x), r1=8(y), r2=75(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 8
LDI r2, 75
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
