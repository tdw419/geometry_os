; DESCRIPTION: Creates a cyan rectangular region at (101, 51) spanning 96 by 119 pixels.
; PLAN: r0=101(x), r1=51(y), r2=96(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 51
LDI r2, 96
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
