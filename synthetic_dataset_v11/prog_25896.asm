; DESCRIPTION: Creates a orange rectangular region at (168, 14) spanning 49 by 89 pixels.
; PLAN: r0=168(x), r1=14(y), r2=49(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 14
LDI r2, 49
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
