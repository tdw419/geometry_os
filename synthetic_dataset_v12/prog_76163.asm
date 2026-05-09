; DESCRIPTION: Creates a cyan rectangular region at (104, 200) spanning 85 by 54 pixels.
; PLAN: r0=104(x), r1=200(y), r2=85(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 200
LDI r2, 85
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
