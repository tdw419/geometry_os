; DESCRIPTION: Creates a black rectangular region at (445, 58) spanning 25 by 66 pixels.
; PLAN: r0=445(x), r1=58(y), r2=25(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 58
LDI r2, 25
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
