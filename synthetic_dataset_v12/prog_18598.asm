; DESCRIPTION: Creates a orange rectangular region at (160, 118) spanning 64 by 73 pixels.
; PLAN: r0=160(x), r1=118(y), r2=64(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 118
LDI r2, 64
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
