; DESCRIPTION: Creates a black rectangular region at (187, 63) spanning 14 by 18 pixels.
; PLAN: r0=187(x), r1=63(y), r2=14(width), r3=18(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 63
LDI r2, 14
LDI r3, 18
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
