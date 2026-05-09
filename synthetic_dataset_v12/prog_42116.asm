; DESCRIPTION: Creates a black rectangular region at (38, 187) spanning 52 by 14 pixels.
; PLAN: r0=38(x), r1=187(y), r2=52(width), r3=14(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 187
LDI r2, 52
LDI r3, 14
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
