; DESCRIPTION: Creates a cyan rectangular region at (43, 190) spanning 96 by 47 pixels.
; PLAN: r0=43(x), r1=190(y), r2=96(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 190
LDI r2, 96
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
