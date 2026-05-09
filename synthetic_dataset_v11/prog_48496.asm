; DESCRIPTION: Creates a cyan rectangular region at (122, 102) spanning 93 by 51 pixels.
; PLAN: r0=122(x), r1=102(y), r2=93(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 102
LDI r2, 93
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
