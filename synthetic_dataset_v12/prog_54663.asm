; DESCRIPTION: Creates a cyan rectangular region at (200, 84) spanning 109 by 75 pixels.
; PLAN: r0=200(x), r1=84(y), r2=109(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 84
LDI r2, 109
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
