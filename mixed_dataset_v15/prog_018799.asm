; DESCRIPTION: Creates a yellow rectangular region at (40, 187) spanning 18 by 46 pixels.
; PLAN: r0=40(x), r1=187(y), r2=18(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 187
LDI r2, 18
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
