; DESCRIPTION: Creates a cyan rectangular region at (223, 55) spanning 51 by 55 pixels.
; PLAN: r0=223(x), r1=55(y), r2=51(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 55
LDI r2, 51
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
