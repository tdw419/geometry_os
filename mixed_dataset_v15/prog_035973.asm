; DESCRIPTION: Creates a yellow rectangular region at (438, 96) spanning 40 by 39 pixels.
; PLAN: r0=438(x), r1=96(y), r2=40(width), r3=39(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 96
LDI r2, 40
LDI r3, 39
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
