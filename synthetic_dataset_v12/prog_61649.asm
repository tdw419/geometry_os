; DESCRIPTION: Creates a orange rectangular region at (272, 41) spanning 111 by 59 pixels.
; PLAN: r0=272(x), r1=41(y), r2=111(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 41
LDI r2, 111
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
