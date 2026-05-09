; DESCRIPTION: Creates a orange rectangular region at (137, 93) spanning 28 by 17 pixels.
; PLAN: r0=137(x), r1=93(y), r2=28(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 93
LDI r2, 28
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
