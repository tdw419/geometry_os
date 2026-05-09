; DESCRIPTION: Creates a yellow rectangular region at (174, 188) spanning 36 by 11 pixels.
; PLAN: r0=174(x), r1=188(y), r2=36(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 188
LDI r2, 36
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
