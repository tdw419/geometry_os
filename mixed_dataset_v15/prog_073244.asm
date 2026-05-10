; DESCRIPTION: Creates a cyan rectangular region at (423, 71) spanning 83 by 14 pixels.
; PLAN: r0=423(x), r1=71(y), r2=83(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 71
LDI r2, 83
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
