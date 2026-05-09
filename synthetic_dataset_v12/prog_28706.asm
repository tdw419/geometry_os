; DESCRIPTION: Creates a orange rectangular region at (221, 13) spanning 90 by 18 pixels.
; PLAN: r0=221(x), r1=13(y), r2=90(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 13
LDI r2, 90
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
