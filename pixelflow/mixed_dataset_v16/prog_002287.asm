; DESCRIPTION: Creates a orange rectangular region at (82, 114) spanning 93 by 75 pixels.
; PLAN: r0=82(x), r1=114(y), r2=93(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 114
LDI r2, 93
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
