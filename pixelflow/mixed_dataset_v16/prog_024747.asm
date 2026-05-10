; DESCRIPTION: Creates a orange rectangular region at (250, 138) spanning 93 by 39 pixels.
; PLAN: r0=250(x), r1=138(y), r2=93(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 138
LDI r2, 93
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
