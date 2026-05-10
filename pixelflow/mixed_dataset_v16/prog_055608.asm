; DESCRIPTION: Creates a cyan rectangular region at (83, 27) spanning 20 by 76 pixels.
; PLAN: r0=83(x), r1=27(y), r2=20(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 27
LDI r2, 20
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
