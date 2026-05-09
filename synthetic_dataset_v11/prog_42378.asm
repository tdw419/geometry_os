; DESCRIPTION: Creates a black rectangular region at (42, 33) spanning 99 by 51 pixels.
; PLAN: r0=42(x), r1=33(y), r2=99(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 33
LDI r2, 99
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
