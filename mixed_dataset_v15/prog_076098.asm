; DESCRIPTION: Creates a cyan rectangular region at (109, 68) spanning 33 by 70 pixels.
; PLAN: r0=109(x), r1=68(y), r2=33(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 68
LDI r2, 33
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
