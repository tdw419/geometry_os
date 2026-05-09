; DESCRIPTION: Creates a cyan rectangular region at (105, 115) spanning 100 by 74 pixels.
; PLAN: r0=105(x), r1=115(y), r2=100(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 115
LDI r2, 100
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
