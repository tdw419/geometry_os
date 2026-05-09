; DESCRIPTION: Creates a cyan rectangular region at (44, 51) spanning 69 by 61 pixels.
; PLAN: r0=44(x), r1=51(y), r2=69(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 51
LDI r2, 69
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
