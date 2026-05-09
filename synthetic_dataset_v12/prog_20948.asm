; DESCRIPTION: Creates a orange rectangular region at (272, 35) spanning 120 by 28 pixels.
; PLAN: r0=272(x), r1=35(y), r2=120(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 35
LDI r2, 120
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
