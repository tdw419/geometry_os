; DESCRIPTION: Creates a orange rectangular region at (127, 170) spanning 111 by 49 pixels.
; PLAN: r0=127(x), r1=170(y), r2=111(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 170
LDI r2, 111
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
