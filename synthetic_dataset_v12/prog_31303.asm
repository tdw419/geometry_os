; DESCRIPTION: Creates a orange rectangular region at (272, 194) spanning 71 by 14 pixels.
; PLAN: r0=272(x), r1=194(y), r2=71(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 194
LDI r2, 71
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
