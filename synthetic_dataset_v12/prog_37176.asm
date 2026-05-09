; DESCRIPTION: Creates a cyan rectangular region at (51, 58) spanning 55 by 35 pixels.
; PLAN: r0=51(x), r1=58(y), r2=55(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 58
LDI r2, 55
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
