; DESCRIPTION: Creates a cyan rectangular region at (361, 76) spanning 93 by 20 pixels.
; PLAN: r0=361(x), r1=76(y), r2=93(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 76
LDI r2, 93
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
