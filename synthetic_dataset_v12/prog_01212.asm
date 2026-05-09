; DESCRIPTION: Creates a cyan rectangular region at (340, 51) spanning 20 by 108 pixels.
; PLAN: r0=340(x), r1=51(y), r2=20(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 51
LDI r2, 20
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
