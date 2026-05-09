; DESCRIPTION: Creates a orange rectangular region at (8, 128) spanning 58 by 51 pixels.
; PLAN: r0=8(x), r1=128(y), r2=58(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 128
LDI r2, 58
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
