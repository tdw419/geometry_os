; DESCRIPTION: Creates a yellow rectangular region at (44, 55) spanning 50 by 51 pixels.
; PLAN: r0=44(x), r1=55(y), r2=50(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 55
LDI r2, 50
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
