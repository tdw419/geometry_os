; DESCRIPTION: Creates a orange rectangular region at (57, 8) spanning 51 by 60 pixels.
; PLAN: r0=57(x), r1=8(y), r2=51(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 8
LDI r2, 51
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
