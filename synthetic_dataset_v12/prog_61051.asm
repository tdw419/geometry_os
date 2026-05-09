; DESCRIPTION: Creates a black rectangular region at (213, 65) spanning 41 by 30 pixels.
; PLAN: r0=213(x), r1=65(y), r2=41(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 65
LDI r2, 41
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
