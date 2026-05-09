; DESCRIPTION: Creates a black rectangular region at (272, 208) spanning 95 by 22 pixels.
; PLAN: r0=272(x), r1=208(y), r2=95(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 208
LDI r2, 95
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
