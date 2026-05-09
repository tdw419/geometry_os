; DESCRIPTION: Creates a orange rectangular region at (14, 140) spanning 60 by 93 pixels.
; PLAN: r0=14(x), r1=140(y), r2=60(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 140
LDI r2, 60
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
