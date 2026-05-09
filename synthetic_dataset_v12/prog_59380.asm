; DESCRIPTION: Creates a orange rectangular region at (44, 95) spanning 111 by 115 pixels.
; PLAN: r0=44(x), r1=95(y), r2=111(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 95
LDI r2, 111
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
