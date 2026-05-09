; DESCRIPTION: Creates a orange rectangular region at (169, 73) spanning 93 by 71 pixels.
; PLAN: r0=169(x), r1=73(y), r2=93(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 73
LDI r2, 93
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
