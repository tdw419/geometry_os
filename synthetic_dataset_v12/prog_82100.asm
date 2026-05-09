; DESCRIPTION: Creates a cyan rectangular region at (53, 51) spanning 83 by 65 pixels.
; PLAN: r0=53(x), r1=51(y), r2=83(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 51
LDI r2, 83
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
