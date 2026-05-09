; DESCRIPTION: Creates a yellow rectangular region at (405, 157) spanning 50 by 90 pixels.
; PLAN: r0=405(x), r1=157(y), r2=50(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 157
LDI r2, 50
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
