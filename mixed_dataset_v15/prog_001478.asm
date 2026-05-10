; DESCRIPTION: Creates a black rectangular region at (207, 96) spanning 96 by 25 pixels.
; PLAN: r0=207(x), r1=96(y), r2=96(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 96
LDI r2, 96
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
