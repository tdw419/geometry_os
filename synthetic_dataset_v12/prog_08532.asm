; DESCRIPTION: Creates a orange rectangular region at (449, 71) spanning 49 by 52 pixels.
; PLAN: r0=449(x), r1=71(y), r2=49(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 71
LDI r2, 49
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
