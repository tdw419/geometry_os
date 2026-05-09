; DESCRIPTION: Creates a orange rectangular region at (274, 40) spanning 111 by 90 pixels.
; PLAN: r0=274(x), r1=40(y), r2=111(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 40
LDI r2, 111
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
