; DESCRIPTION: Creates a yellow rectangular region at (210, 187) spanning 11 by 59 pixels.
; PLAN: r0=210(x), r1=187(y), r2=11(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 187
LDI r2, 11
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
