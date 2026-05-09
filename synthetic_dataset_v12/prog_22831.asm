; DESCRIPTION: Creates a black rectangular region at (111, 144) spanning 45 by 112 pixels.
; PLAN: r0=111(x), r1=144(y), r2=45(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 144
LDI r2, 45
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
