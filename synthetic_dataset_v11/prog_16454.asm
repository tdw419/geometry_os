; DESCRIPTION: Creates a black rectangular region at (68, 60) spanning 36 by 112 pixels.
; PLAN: r0=68(x), r1=60(y), r2=36(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 60
LDI r2, 36
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
