; DESCRIPTION: Creates a white rectangular region at (438, 208) spanning 39 by 26 pixels.
; PLAN: r0=438(x), r1=208(y), r2=39(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 208
LDI r2, 39
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
