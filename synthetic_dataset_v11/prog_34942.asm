; DESCRIPTION: Creates a orange rectangular region at (96, 192) spanning 111 by 52 pixels.
; PLAN: r0=96(x), r1=192(y), r2=111(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 192
LDI r2, 111
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
