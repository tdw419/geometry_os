; DESCRIPTION: Creates a yellow rectangular region at (367, 210) spanning 85 by 33 pixels.
; PLAN: r0=367(x), r1=210(y), r2=85(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 210
LDI r2, 85
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
