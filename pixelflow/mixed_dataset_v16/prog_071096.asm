; DESCRIPTION: Creates a orange rectangular region at (466, 98) spanning 15 by 93 pixels.
; PLAN: r0=466(x), r1=98(y), r2=15(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 98
LDI r2, 15
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
