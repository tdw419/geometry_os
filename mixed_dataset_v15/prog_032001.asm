; DESCRIPTION: Creates a red rectangular region at (367, 26) spanning 18 by 18 pixels.
; PLAN: r0=367(x), r1=26(y), r2=18(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 26
LDI r2, 18
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
