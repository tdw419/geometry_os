; DESCRIPTION: Creates a cyan rectangular region at (61, 155) spanning 70 by 75 pixels.
; PLAN: r0=61(x), r1=155(y), r2=70(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 155
LDI r2, 70
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
