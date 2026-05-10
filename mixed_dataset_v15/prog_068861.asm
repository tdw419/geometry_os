; DESCRIPTION: Creates a cyan rectangular region at (190, 98) spanning 85 by 86 pixels.
; PLAN: r0=190(x), r1=98(y), r2=85(width), r3=86(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 98
LDI r2, 85
LDI r3, 86
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
