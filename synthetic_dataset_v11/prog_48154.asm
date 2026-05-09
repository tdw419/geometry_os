; DESCRIPTION: Creates a cyan rectangular region at (37, 74) spanning 85 by 89 pixels.
; PLAN: r0=37(x), r1=74(y), r2=85(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 74
LDI r2, 85
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
