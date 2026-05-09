; DESCRIPTION: Creates a yellow rectangular region at (272, 178) spanning 55 by 16 pixels.
; PLAN: r0=272(x), r1=178(y), r2=55(width), r3=16(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 178
LDI r2, 55
LDI r3, 16
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
