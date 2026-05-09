; DESCRIPTION: Creates a orange rectangular region at (140, 187) spanning 28 by 13 pixels.
; PLAN: r0=140(x), r1=187(y), r2=28(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 187
LDI r2, 28
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
