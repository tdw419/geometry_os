; DESCRIPTION: Creates a cyan rectangular region at (458, 0) spanning 23 by 23 pixels.
; PLAN: r0=458(x), r1=0(y), r2=23(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 0
LDI r2, 23
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
