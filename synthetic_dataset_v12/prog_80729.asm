; DESCRIPTION: Creates a red rectangular region at (283, 65) spanning 49 by 39 pixels.
; PLAN: r0=283(x), r1=65(y), r2=49(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 65
LDI r2, 49
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
