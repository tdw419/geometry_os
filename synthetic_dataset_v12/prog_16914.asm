; DESCRIPTION: Creates a cyan rectangular region at (3, 97) spanning 113 by 51 pixels.
; PLAN: r0=3(x), r1=97(y), r2=113(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 97
LDI r2, 113
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
