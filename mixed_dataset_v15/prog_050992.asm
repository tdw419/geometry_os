; DESCRIPTION: Creates a yellow rectangular region at (195, 72) spanning 103 by 97 pixels.
; PLAN: r0=195(x), r1=72(y), r2=103(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 72
LDI r2, 103
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
