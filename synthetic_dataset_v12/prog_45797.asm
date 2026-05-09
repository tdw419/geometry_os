; DESCRIPTION: Creates a black rectangular region at (272, 106) spanning 98 by 45 pixels.
; PLAN: r0=272(x), r1=106(y), r2=98(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 106
LDI r2, 98
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
