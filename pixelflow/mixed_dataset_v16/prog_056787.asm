; DESCRIPTION: Creates a cyan rectangular region at (134, 51) spanning 66 by 55 pixels.
; PLAN: r0=134(x), r1=51(y), r2=66(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 51
LDI r2, 66
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
