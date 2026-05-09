; DESCRIPTION: Creates a orange rectangular region at (382, 37) spanning 111 by 112 pixels.
; PLAN: r0=382(x), r1=37(y), r2=111(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 37
LDI r2, 111
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
