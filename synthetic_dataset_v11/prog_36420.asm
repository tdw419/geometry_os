; DESCRIPTION: Creates a cyan rectangular region at (34, 89) spanning 55 by 100 pixels.
; PLAN: r0=34(x), r1=89(y), r2=55(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 89
LDI r2, 55
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
