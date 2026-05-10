; DESCRIPTION: Creates a yellow rectangular region at (349, 187) spanning 104 by 26 pixels.
; PLAN: r0=349(x), r1=187(y), r2=104(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 187
LDI r2, 104
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
