; DESCRIPTION: Creates a cyan rectangular region at (1, 46) spanning 89 by 57 pixels.
; PLAN: r0=1(x), r1=46(y), r2=89(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 46
LDI r2, 89
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
