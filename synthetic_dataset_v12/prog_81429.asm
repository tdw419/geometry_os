; DESCRIPTION: Creates a cyan rectangular region at (409, 95) spanning 68 by 44 pixels.
; PLAN: r0=409(x), r1=95(y), r2=68(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 95
LDI r2, 68
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
