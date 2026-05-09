; DESCRIPTION: Creates a cyan rectangular region at (69, 115) spanning 74 by 51 pixels.
; PLAN: r0=69(x), r1=115(y), r2=74(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 115
LDI r2, 74
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
