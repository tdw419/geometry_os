; DESCRIPTION: Creates a orange rectangular region at (391, 139) spanning 28 by 98 pixels.
; PLAN: r0=391(x), r1=139(y), r2=28(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 139
LDI r2, 28
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
