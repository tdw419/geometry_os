; DESCRIPTION: Creates a cyan rectangular region at (436, 89) spanning 55 by 33 pixels.
; PLAN: r0=436(x), r1=89(y), r2=55(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 89
LDI r2, 55
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
