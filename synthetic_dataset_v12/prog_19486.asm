; DESCRIPTION: Creates a yellow rectangular region at (401, 143) spanning 83 by 33 pixels.
; PLAN: r0=401(x), r1=143(y), r2=83(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 143
LDI r2, 83
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
