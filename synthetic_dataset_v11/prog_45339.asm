; DESCRIPTION: Creates a cyan rectangular region at (105, 87) spanning 26 by 51 pixels.
; PLAN: r0=105(x), r1=87(y), r2=26(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 87
LDI r2, 26
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
