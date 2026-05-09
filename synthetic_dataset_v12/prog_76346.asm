; DESCRIPTION: Creates a cyan rectangular region at (33, 165) spanning 70 by 75 pixels.
; PLAN: r0=33(x), r1=165(y), r2=70(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 165
LDI r2, 70
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
