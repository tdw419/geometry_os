; DESCRIPTION: Creates a yellow rectangular region at (174, 187) spanning 31 by 67 pixels.
; PLAN: r0=174(x), r1=187(y), r2=31(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 187
LDI r2, 31
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
