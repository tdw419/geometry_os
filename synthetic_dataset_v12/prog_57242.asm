; DESCRIPTION: Creates a yellow rectangular region at (401, 31) spanning 23 by 70 pixels.
; PLAN: r0=401(x), r1=31(y), r2=23(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 31
LDI r2, 23
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
