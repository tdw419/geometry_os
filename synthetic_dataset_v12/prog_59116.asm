; DESCRIPTION: Creates a red rectangular region at (438, 170) spanning 27 by 11 pixels.
; PLAN: r0=438(x), r1=170(y), r2=27(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 170
LDI r2, 27
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
