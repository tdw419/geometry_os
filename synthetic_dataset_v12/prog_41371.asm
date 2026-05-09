; DESCRIPTION: Creates a cyan rectangular region at (416, 4) spanning 60 by 75 pixels.
; PLAN: r0=416(x), r1=4(y), r2=60(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 4
LDI r2, 60
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
