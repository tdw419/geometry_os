; DESCRIPTION: Creates a white rectangular region at (106, 33) spanning 51 by 44 pixels.
; PLAN: r0=106(x), r1=33(y), r2=51(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 33
LDI r2, 51
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
