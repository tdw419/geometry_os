; DESCRIPTION: Creates a orange rectangular region at (128, 138) spanning 47 by 71 pixels.
; PLAN: r0=128(x), r1=138(y), r2=47(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 138
LDI r2, 47
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
