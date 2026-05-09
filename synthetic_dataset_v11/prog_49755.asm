; DESCRIPTION: Creates a orange rectangular region at (17, 36) spanning 98 by 52 pixels.
; PLAN: r0=17(x), r1=36(y), r2=98(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 36
LDI r2, 98
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
