; DESCRIPTION: Creates a yellow rectangular region at (383, 111) spanning 45 by 90 pixels.
; PLAN: r0=383(x), r1=111(y), r2=45(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 111
LDI r2, 45
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
