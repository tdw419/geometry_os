; DESCRIPTION: Creates a orange rectangular region at (24, 67) spanning 96 by 93 pixels.
; PLAN: r0=24(x), r1=67(y), r2=96(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 67
LDI r2, 96
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
