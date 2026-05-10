; DESCRIPTION: Creates a cyan rectangular region at (33, 43) spanning 51 by 13 pixels.
; PLAN: r0=33(x), r1=43(y), r2=51(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 43
LDI r2, 51
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
