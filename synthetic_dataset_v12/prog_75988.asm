; DESCRIPTION: Creates a yellow rectangular region at (249, 187) spanning 65 by 67 pixels.
; PLAN: r0=249(x), r1=187(y), r2=65(width), r3=67(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 187
LDI r2, 65
LDI r3, 67
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
